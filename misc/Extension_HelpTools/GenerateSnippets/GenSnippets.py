# -- coding: cp1252 --
import os

path = os.path.dirname(os.path.abspath(__file__)) + '\\SnippetBody_Input.asy'
path2 = os.path.dirname(os.path.abspath(__file__)) + '\\SnippetBody_Output'
outputFile = open(path2, "w") 

with open(path) as inf:
    for line in inf:
        str = line.replace('"', r'\"')
        str = str.replace('\t', '    ')
        str2 = '            "' + str.rstrip("\n") + '",\n'
        outputFile.write(str2)