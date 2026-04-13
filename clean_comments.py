import sys
import re
import os

def remove_comments(text):
    # Matches strings (group 1) or comments (group 2)
    # We want to keep doc comments /// but remove // (unless it's ///)
    # Multi-line strings, single-line strings
    # Group 1: strings
    # Group 2: comments (/* ... */ or // ...)
    
    # regex for string:
    # """.*?""" or '''.*?'''
    # "..." or '...' (handling escaped quotes)
    string_pattern = r'(""".*?"""|\'\'\'.*?\'\'\'|".*?(?<!\\)(\\\\)*"|\'.*?(?<!\\)(\\\\)*\')'
    
    # regex for comments:
    # /* ... */
    # //... where the third char is not /
    # So //(?!/).*
    comment_pattern = r'(/\*.*?\*/|//(?!/).*)'
    
    pattern = string_pattern + r'|' + comment_pattern

    def replacer(match):
        if match.group(1) is not None:
            return match.group(1) # Keep string
        else:
            return "" # Remove comment

    return re.sub(pattern, replacer, text, flags=re.MULTILINE|re.DOTALL)

def process_dir(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.dart'):
                # skip generated files
                if file.endswith('.g.dart') or file.endswith('.freezed.dart'):
                    continue
                filepath = os.path.join(root, file)
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                new_content = remove_comments(content)
                
                # clean up spaces left by inline comments at end of line
                new_content = re.sub(r'[\t ]+\n', '\n', new_content)
                
                if new_content != content:
                    with open(filepath, 'w', encoding='utf-8') as f:
                        f.write(new_content)
                    print(f"Cleaned {filepath}")

if __name__ == '__main__':
    process_dir('lib')
