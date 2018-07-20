import os
import pysftp
import sys
import subprocess
import glob 
sys.path.append("C:\Users\jinkersont\.gnupg")
sys.path.append("C:\Users\jinkersont")
sys.path.append("C:\Program Files (x86)\gnupg\\bin")
print(sys.path)

UPLOAD = {
    "SERVER":   "192.168.80.33",
    "PORT":     22,
    "USERNAME": "sftpuser",
    "KEYFILE":  "C:\Users\jinkersont\.ssh\id_dsa.pub",
    "FOLDER":   "documents",
    "TRANSFORMATION": "stars.ktr",
    "GPGKEY": 	"tim.jinkerson@ev.uk"
}
SUFFIX=".out"

PAN = "C:\Pentaho\design-tools\data-integration\Pan.bat"
GPG = "C:\Program Files (x86)\gnupg\\bin\gpg.exe"

print GPG
if not os.path.exists(GPG) :
   print "Could not locate gpg!"
   exit(-1)

from optparse import OptionParser
parser = OptionParser()
parser.add_option("-t", "--transformation", dest="transformation",
                 help="Transformation File", metavar="FILE")
parser.add_option("-d", "--directory", dest="directory",
                 help="upload directory", metavar="DIRECTORY")
parser.add_option("-s", "--server", dest="server",
                 help="Upload Server", metavar="SERVER")
parser.add_option("-p", "--port", dest="port",
                 help="Upload Host Port", metavar="PORT", type="int")
parser.add_option("-g", "--gpgkey", dest="gpgkey",
                 help="The GPG Key", metavar="GPGKEY")
(options, args) = parser.parse_args()				  

if not options.server :
    options.server = UPLOAD['SERVER']

if not options.port :
    options.port = UPLOAD['PORT']    
	
if not options.directory :
    options.directory = UPLOAD['FOLDER']

if not options.transformation :
    options.transformation = UPLOAD['TRANSFORMATION']

if not os.path.exists(options.transformation) :
    print "Transformation file not found"
    exit(-1)
if not options.gpgkey :
	options.gpgkey = UPLOAD['GPGKEY']

# Run the transformation
print "Running " + PAN + " -file " + options.transformation
return_code = subprocess.call(PAN + " -file " + options.transformation)

# Encrypt the file
path = 'MyData*.csv'   
files=glob.glob(path)   
for file in files:
	if not os.path.exists(file) :
		print "Error: " + file + " do not exists"
		exit(-1)
	call_line = [GPG, "-r", options.gpgkey, "-e", file]
	print call_line
	return_code = subprocess.call(call_line)
	if return_code > 0 :
		print "Exiting: Encryption Failed - Status " + str(return_code)
		exit(-1)
	os.remove(file)

# sftp the file
print "SFTP the file"

cnopts = pysftp.CnOpts()
cnopts.hostkeys.load(UPLOAD['KEYFILE'])
srv = pysftp.Connection(options.server, port=options.port, 
                        username=UPLOAD['USERNAME'], cnopts=cnopts )

srv.chdir(options.directory)

path = 'MyData*.gpg'   
files=glob.glob(path)
for file in files:
	print "Uploading " + file
	srv.put(file)
	os.remove(file)

srv.close()
