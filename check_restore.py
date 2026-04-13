import os
import json
import urllib.parse
import shutil

history_dir = "/Users/ibnusaputra/Library/Application Support/Code/User/History"
project_prefix = "file:///Users/ibnusaputra/Documents/Dev/avis_pos/lib"

cutoff_ms = 1775266600000 # Just before the truncation 

restorable = []
not_found = []

def get_best_entry(entries, folder_path):
    # candidate threshold 1775266600000
    candidates = [e for e in entries if e.get("timestamp", 0) < cutoff_ms]
    if not candidates:
        return None
    # Sort by timestamp descending
    candidates.sort(key=lambda x: x.get("timestamp", 0), reverse=True)
    
    # Wait, instead of just the latest timestamp, the truncation might have happened,
    # and VS Code might have saved the truncated version a few times today!
    # Let's take the latest Candidate, but let's check its size to be sure!
    return candidates[0]

for folder in os.listdir(history_dir):
    folder_path = os.path.join(history_dir, folder)
    if os.path.isdir(folder_path):
        entries_file = os.path.join(folder_path, "entries.json")
        if os.path.exists(entries_file):
            try:
                with open(entries_file, "r") as f:
                    data = json.load(f)
                resource = data.get("resource", "")

                if resource.startswith(project_prefix):
                    entries = data.get("entries", [])
                    best = get_best_entry(entries, folder_path)
                    
                    # Compute actual file path
                    # "file:///Users/..." -> "/Users/..."
                    file_path = urllib.parse.unquote(resource.replace("file://", ""))
                    
                    if best:
                        source_id = best.get("id")
                        source_path = os.path.join(folder_path, source_id)
                        if os.path.exists(source_path):
                            restorable.append((source_path, file_path, best.get("timestamp")))
                    else:
                        not_found.append(file_path)
            except Exception as e:
                pass

print(f"Total files that can be restored from history: {len(restorable)}")
for src, dest, ts in restorable[:5]:
    print(f" - Dest: {dest} (Timestamp: {ts})")
    
# Check how many Dart files currently exist in lib/
import glob
all_darts = glob.glob('/Users/ibnusaputra/Documents/Dev/avis_pos/lib/**/*.dart', recursive=True)
all_darts = [f for f in all_darts if not f.endswith(".g.dart") and not f.endswith(".freezed.dart")]
print(f"Total non-generated Dart files in lib: {len(all_darts)}")

missing = set(all_darts) - set([dest for src, dest, ts in restorable])
print(f"Total files that CANNOT be restored because they aren't in VS Code history: {len(missing)}")
