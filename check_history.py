import os
import json

history_dir = "/Users/ibnusaputra/Library/Application Support/Code/User/History"
project_prefix = "file:///Users/ibnusaputra/Documents/Dev/avis_pos/lib"

found = 0
for folder in os.listdir(history_dir):
    folder_path = os.path.join(history_dir, folder)
    if os.path.isdir(folder_path):
        entries_file = os.path.join(folder_path, "entries.json")
        if os.path.exists(entries_file):
            try:
                with open(entries_file, "r") as f:
                    data = json.load(f)
                if "version" in data and "resource" in data:
                    resource = data["resource"]
                    if resource.startswith(project_prefix):
                        found += 1
                        
            except Exception as e:
                pass
print(f"Total matching files found: {found}")
