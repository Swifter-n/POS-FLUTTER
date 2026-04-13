import os
import json

history_dir = "/Users/ibnusaputra/Library/Application Support/Code/User/History"
project_prefix = "file:///Users/ibnusaputra/Documents/Dev/avis_pos/lib"

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
                        print(json.dumps(data, indent=2))
                        print("Folder path:", folder_path)
                        break
                        
            except Exception as e:
                pass
