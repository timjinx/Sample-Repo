require 'optparse'
require 'sqlite3'
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: parser.rb [options]"
  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  opts.on("-f", "--file [INFILE]", "Input file") do |f|
    options[:infile] = f
  end
  opts.on("-d", "--database [DATABASE]", "SQLite DB Name") do |d|
    options[:database] = d
  end
  opts.on("-t", "--table [TABLE]", "SQLite Table Name") do |t|
    options[:table] = t
  end
end.parse!

puts "Input file #{options[:infile]}\n" if options[:verbose]
puts "Database #{options[:database]}\n" if options[:verbose]
puts "Table #{options[:table]}\n" if options[:verbose]

db = SQLite3::Database.new "#{options[:database]}"

if options[:infile] then
  if ! File.exist?(options[:infile]) then
     abort("#{options[:infile]} not found")
  end
  f = File.open(options[:infile])
else
  f = $stdin
end

lc=0
headers_line = ''
while line = f.gets do
    if lc == 0 then
      headers = line.chomp.split(",")
      oline = "create table #{options[:table]}("
      headers.each { |h| oline += "#{h} varchar(255), " }
      oline.chop!
      oline.chop!
      oline += ");"
      puts oline if options[:verbose]
      rows = db.execute oline
      headers.each { |h| headers_line+= "#{h}, "}
      headers_line.chop!
      headers_line.chop!
    else
      data = line.split(",")
      oline = "insert into #{options[:table]} (" + headers_line + ") values ( "
      values = line.chomp.split(",")
      values.each { |v| oline += "'#{v.strip}', "}
      oline.chop!
      oline.chop!
      oline += ");"
      puts oline if options[:verbose]
      rows = db.execute oline
    end
    lc=lc+1
end

f.close
puts "Processed " + lc.to_s + " records including the header" if options[:verbose]
