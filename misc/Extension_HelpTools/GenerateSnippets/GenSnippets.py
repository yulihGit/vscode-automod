# -- coding: cp1252 --
import os

path = absolute_path = os.path.dirname(os.path.abspath(__file__)) + '\\Input\\SnippetBody.arc'
path2 = absolute_path = os.path.dirname(os.path.abspath(__file__)) + '\\Input\\SnippetBodyJson'
outputFile = open(path2, "w") 

with open(path) as inf:
    for line in inf:
        str = line.replace('"', r'\"')
        str = str.replace('\t', '    ')
        str2 = '            "' + str.rstrip("\n") + '",\n'
        outputFile.write(str2)