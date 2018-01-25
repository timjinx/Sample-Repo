import pexpect
import getpass
import os.path
from optparse import OptionParser
parser = OptionParser()
parser.add_option("-o", "--ofile", dest="ofilename",
                  help="write report to FILE", metavar="FILE")
parser.add_option("-i", "--infile", dest="ifilename",
                  help="Read data from FILE", metavar="INFILE")
parser.add_option("-u", "--user", dest="username",
                  help="user to log in as", metavar="USER")
parser.add_option("-v", action="store_true", dest="verbose", default=False,
                 help="make lots of noise")

(options, args) = parser.parse_args()

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

# Get username
if not options.username :
   v_username = raw_input("Username: ");
else :
   v_username = options.username
# Get the password
v_password = getpass.getpass("Password: ")

if options.verbose :
   print "reading file " + ifilename + "\nwrite to file " + ofilename + "\n"

v_commands = [ 'hostname -f', 'hostname -i', 'uname -s', 'uname -r' ]

ifile = open(ifilename, 'r')
ofile = open(ofilename, 'w')
for server in ifile :
   try:
     server = server.strip()
     v_command = "ssh " + v_username.strip() + "@" + server + " 'echo " 
     for i in range(len(v_commands)):
        v_command = v_command + '`' + v_commands[i] + '`,'
     v_command = v_command.rstrip(',')
     v_command = v_command + "'"
     child = pexpect.spawn(v_command)
     i = child.expect(['continue', 'Password:', 'password:'])
     if i==0:
        if options.verbose :
           print "Accepting " + server
        child.sendline('yes')
        i = child.expect(['Password:', 'password:'])
     child.sendline(v_password)
     j = child.expect(['Permission','password:','Password:', pexpect.EOF], timeout=None)
     if j in (0, 1, 2) :
        print "Unable to access " + server
        continue
     cmd_show_data =  child.before
     cmd_output = cmd_show_data.split('\r\n')
     for data in cmd_output:
        if data.find(server) >= 0 :
           ofile.write(data.strip() + "\n")
     if options.verbose :
        print "Processed " + server

   except:
     print "Unable to process " + server
     continue
ifile.close()
ofile.close()
