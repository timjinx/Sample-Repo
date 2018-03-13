require 'optparse'
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: parser.rb [options]"
  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  opts.on("-f", "--file [INFILE]", "Input file") do |f|
    options[:infile] = f
  end
  opts.on("-o", "--outfile [OUTFILE]", "Output file") do |o|
    options[:outfile] = o
  end
end.parse!

puts "Input file #{options[:infile]},\nOutput file is #{options[:outfile]}" if options[:verbose]

if options[:infile] then
  if ! File.exist?(options[:infile]) then
     abort("#{options[:infile]} not found")
  end
  f = File.open(options[:infile])
else
  f = $stdin
end

if options[:outfile] then
  if File.exist?(options[:outfile]) then
     abort("Refusing to over-write #{options[:outfile]}")
  end
  fout = File.open(options[:outfile], 'w')
else
  fout = $stdout
end

while line = f.gets do
    fout.puts line
end

f.close
fout.close
