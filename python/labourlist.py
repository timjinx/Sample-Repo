#!/usr/bin/python
import os
import re
from optparse import OptionParser
SUFFIX=".out"

def main () :
    global filename
    parser = OptionParser()
    parser.add_option("-l", "--labour", dest="labour",
                      help="Data from the HQ", metavar="LABOUR")
    parser.add_option("-m", "--mailchimp", dest="mailchimp",
                      help="mailchimp data", metavar="MAILCHIMP")
    (options, args) = parser.parse_args()
    if  not options.labour :
        print "You must specify the labour file"
        exit(-1)
    if  not options.mailchimp :
        print "You must specify the mailchimp"
        exit(-1)
    lab = open(options.labour, 'r')
    for line in lab :
        line = line.strip()
        chimpfound=0
        mailchimp = open(options.mailchimp, 'r')
        for chimpline in mailchimp :
           chimpline = chimpline.strip()
           if line.find(chimpline) >  -1 :
             chimpfound=1
             break
        mailchimp.close()
        if chimpfound == 0 :
           print line
    lab.close()

main()
