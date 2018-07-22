# -- coding: cp1252 --
import os
from itertools import (takewhile,repeat)

#Dec 17 '14 at 3:05 Michael Bacon (stackoverflow)
def rawbigcount(filename):
    f = open(filename, 'rb')
    bufgen = takewhile(lambda x: x, (f.raw.read(1024*1024) for _ in repeat(None)))
    return sum( buf.count(b'\n') for buf in bufgen if buf )

def repl(line):
    str_ = line.replace('"', r'\"')
    str_ = str_.replace('\t', '    ')
    return str_

path = os.path.dirname(os.path.abspath(__file__)) + '\\SnippetBody_Input.asy'
path2 = os.path.dirname(os.path.abspath(__file__)) + '\\SnippetBody_Output.json'
outputFile = open(path2, "w") 
rowLines = rawbigcount(path)

with open(path) as f:
    outputFile.write('"§insert_name": {\n ' + \
                      '"prefix": "§insert_name",\n '  + \
                      '"body": [\n')

    for i, line in enumerate(f):
        if i < rowLines:
            str_ = '   "' + repl(line).rstrip("\n") + '",\n'
            outputFile.write(str_)

    str_ =  '   "' + repl(line).rstrip("\n") + '"' + '\n ],\n' + \
            ' "description": "Description \'insert_description\'"\n},'
    outputFile.write(str_)