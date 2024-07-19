import os
import json

"USED TO GENERATE CONTENTS.JSON FOR BOTH BP AND RP"

def getListOfFiles(dirName):
    listOfFile = os.listdir(dirName)
    allFiles = list()
    for entry in listOfFile:
        fullPath = os.path.join(dirName, entry)
        if os.path.isdir(fullPath):
            allFiles = allFiles + getListOfFiles(fullPath)
        else:
            allFiles.append(fullPath)
                
    return allFiles

def addFileToPath(files, folderpath):    
    content = '{ "content": [ ] }'
    content = json.loads(content)
    for file in files:
        file = file.replace(f"{folderpath}\\", "")
        content["content"].append({'path': f'{file}'})
    return json.dumps(content, indent=4)

def writeFile(filepath, content):
    f = open(f"{filepath}\\contents.json", "w")
    content = content.replace("\\\\", "/")
    f.write(f"{content}")
    f.close()

RPfolderpath = f"{os.getcwd()}\\RP"
RPresult = getListOfFiles(RPfolderpath)
RPcontent = addFileToPath(RPresult, RPfolderpath)
writeFile(RPfolderpath, RPcontent)

BPfolderpath = f"{os.getcwd()}\\BP"
BPresult = getListOfFiles(BPfolderpath)
BPcontent = addFileToPath(BPresult, BPfolderpath)
writeFile(BPfolderpath, BPcontent)
