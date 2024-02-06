# EValue Infrastructure Team - January 2024
# Author Tim Jinkerson <tim.jinkerson@aol.com>
# test mysql and sqlite3 connections

import mysql.connector
from optparse import OptionParser
from datetime import datetime
import getpass
import sqlite3

DEFAULT = {
    "DBHOST": "localhost",
    "DBPORT": "3306",
    "DBNAME": "mydb",
    "DBUSER": "dbuser",
    "DBPASSWD": "dbpasswd",
    "SOCKET": "/run/mysqld/mysqld.sock"
}

def main():
    parser = OptionParser()
    parser.add_option("-d",
                      "--database",
                      dest="dbname",
                      help="Database to fix",
                      metavar="DBNAME")
    parser.add_option("-u",
                      "--user",
                      dest="dbuser",
                      help="Database user",
                      metavar="DBUSER")
    parser.add_option("-p",
                      "--password",
                      action="store_true",
                      dest="enterpassword",
                      default=False,
                      help="The user wishes to enter a password")
    parser.add_option("-H",
                      "--host",
                      dest="dbhost",
                      help="Database host",
                      metavar="DBHOST")
    parser.add_option("-P",
                      "--port",
                      dest="dbport",
                      help="Database port",
                      metavar="DBPORT")
    parser.add_option("-s", "--socket",
                      dest="socket", help="Socket", action="store_true", default=False,
                      metavar="SOCKET")

    (options, args) = parser.parse_args()
    dbname = DEFAULT["DBNAME"]
    dbuser = DEFAULT["DBUSER"]
    dbpasswd = DEFAULT["DBPASSWD"]
    dbhost = DEFAULT["DBHOST"]
    dbport = DEFAULT["DBPORT"]
    dbsocket = DEFAULT["SOCKET"]

    if options.dbname:
        dbname = options.dbname
    if options.dbuser:
        dbuser = options.dbuser
    if options.dbhost:
        dbhost = options.dbhost
    if options.dbport:
        dbport = options.dbport

    if options.socket and options.dbuser:
        print("You can not specify the user when using a socket")
        exit(-1)

    if options.enterpassword:
        try:
            p = getpass.getpass()
        except Exception as error:
            print('ERROR', error)
        else:
            dbpasswd = p


    if options.socket:
        dbuser = getpass.getuser()
        print("Using socket authentication, user is %s" % dbuser)
        print("DBSocket is %s" % dbsocket)
        mysqldb = mysql.connector.connect(user=dbuser,
                                database=dbname,
                                unix_socket=dbsocket,
                                auth_plugin='auth_socket')
    else:
        mysqldb = mysql.connector.connect(host=dbhost,
                                 port=dbport,
                                 database=dbname,
                                 user=dbuser,
                                 passwd=dbpasswd,
                                 auth_plugin='mysql_native_password')
    print(mysqldb)

    sqlitefilenamefull = "/var/tmp/test.sqlite3"
    print("Creating %s" % sqlitefilenamefull)

    slcon = sqlite3.connect(sqlitefilenamefull)
    slcursor = slcon.cursor()
    print(slcon)

    mysqldb.close()
    slcon.close()

    exit(0)

if __name__ == "__main__":
    main()
