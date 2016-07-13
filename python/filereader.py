#!/usr/bin/python
import os
import re
from optparse import OptionParser
SUFFIX=".out"

def main () :
    global filename
    parser = OptionParser()
    parser.add_option("-f", "--file", dest="filename",
                      help="the file to update", metavar="FILE")
    parser.add_option("-n", "--name", dest="name",
                      help="the name to replace the original name with", metavar="NAME")
    parser.add_option("-c", "--fromname", dest="fromname",
                      help="the name be replaced", metavar="FROMNAME")
    (options, args) = parser.parse_args()
    if  not options.filename :
        print "You must specify the file to modify"
        exit(-1)
    if  not options.name :
        print "You must specify the name to replace Tim with"
        exit(-1)
    if  not options.fromname :
        print "You must specify the name to be replaced"
        exit(-1)
    fin = open(options.filename, 'r')
    fout = open(options.filename + SUFFIX, 'w')

    for line in fin :
        fout.write(re.sub(options.fromname, options.name, line))
    fin.close()
    fout.close()

main()
