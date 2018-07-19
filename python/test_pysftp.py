import os
import pysftp
import sys
UPLOAD = {
    "HOST":     "192.168.80.33",
    "PORT":     22,
    "USERNAME": "sftpuser",
    "KEYFILE":  "C:\Users\jinkersont\.ssh\id_dsa.pub",
    "FOLDER":   "documents"
}

from optparse import OptionParser
parser = OptionParser()
parser.add_option("-f", "--file", dest="filename",
                 help="File to upload", metavar="INFILE")
parser.add_option("-d", "--directory", dest="directory",
                 help="upload directory", metavar="DIRECTORY")
(options, args) = parser.parse_args()
				  
if not options.filename :
    filename = raw_input("Enter input file: ")
else :
    filename = options.filename.strip()
	
if not os.path.exists(filename) :
   print "Specified input file not found"
   exit(-1)

if not options.directory :
    options.directory = UPLOAD['FOLDER']

cnopts = pysftp.CnOpts()
cnopts.hostkeys.load(UPLOAD['KEYFILE'])

srv = pysftp.Connection(host=UPLOAD['HOST'], port=UPLOAD['PORT'], 
                        username=UPLOAD['USERNAME'], cnopts=cnopts )
						
srv.chdir(options.directory)
srv.put(options.filename)
srv.close()
