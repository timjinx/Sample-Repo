$ cat server.csv
name,ip_addr,memory,disk
anteater,192.168.1.2,32,3000
bonobo,192.168.1.2,64,2000
catapillar,192.168.1.3,48,6000

tjinkers@TJINKERS-LAP ~/ruby
$ ruby dbwriter.rb -f server.csv -d server.sqlite3  -t servers -v
Input file server.csv
Database server.sqlite3
Table servers
create table servers(name varchar(255), ip_addr varchar(255), memory varchar(255), disk varchar(255));
insert into servers (name, ip_addr, memory, disk) values ( 'anteater', '192.168.1.2', '32', '3000');
insert into servers (name, ip_addr, memory, disk) values ( 'bonobo', '192.168.1.2', '64', '2000');
insert into servers (name, ip_addr, memory, disk) values ( 'catapillar', '192.168.1.3', '48', '6000');
Processed 4 records including the header

tjinkers@TJINKERS-LAP ~/ruby
$ sqlite3 server.sqlite3
SQLite version 3.21.0 2017-10-24 18:55:49
Enter ".help" for usage hints.
sqlite> select * from servers;
anteater|192.168.1.2|32|3000
bonobo|192.168.1.2|64|2000
catapillar|192.168.1.3|48|6000
sqlite> .q

tjinkers@TJINKERS-LAP ~/ruby
$

