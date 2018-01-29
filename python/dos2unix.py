import os.path
import sys
from optparse import OptionParser
parser = OptionParser()
parser.add_option("-o", "--ofile", dest="ofilename",
                  help="write report to FILE", metavar="FILE")
parser.add_option("-i", "--infile", dest="ifilename",
                  help="Read data from FILE", metavar="INFILE")
parser.add_option("--dos2unix", action="store_true", dest="dos2unix", default=False,
                 help="convert dos to unix")
parser.add_option("--unix2dos", action="store_true", dest="unix2dos", default=False,
                 help="convert unix to dos")

(options, args) = parser.parse_args()

if options.dos2unix and options.unix2dos :
   print "Specify either dos2unix or unix2dos"
   exit(-1)

if not ( options.dos2unix or options.unix2dos ) :
   print "Specify either dos2unix or unix2dos"
   exit(-1)

if options.dos2unix :
   eol = "\n"
else :
   eol = "\r\n"

if not options.ifilename :
   ifilename = raw_input("Enter input file: ")
else :
   ifilename = options.ifilename.strip()

if not options.ofilename :
   ofilename = raw_input("Enter output file: ")
else :
   ofilename = options.ofilename.strip()

if ifilename == ofilename :
   print "File names must not be the same"
   exit(-1)

if not os.path.exists(ifilename) :
   print "Specified input file not found"
   exit(-1)

ifile = open(ifilename, 'r')
ofile = open(ofilename, 'w')

for iline in ifile :
   ofile.write(iline.strip() + eol)

ifile.close()
ofile.close()
