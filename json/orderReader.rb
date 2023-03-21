require "json"

def main()
	filename = 'order2.json'
	if ! File.exist?(filename) then
		abort(filename + " not found")
	end
	f = File.open(filename)
	orderStr = f.read()
	parsed = JSON.parse(orderStr)
	total = 0
	tabletotals = Hash.new
	parsed.each do |order| 
		total += order['total']
		if tabletotals.has_key?(order['table']) then
			newvalue = "#{tabletotals[order['table']]}".to_f + order['total']
			tabletotals[order['table']] = newvalue
		else
			tabletotals[order['table']] = order['total']
		end
	end
	tabletotals.each do | table, amount |
		puts "Table %s had a total of £%0.2f" % [table, amount]
	end
	puts "The grand total is £%0.2f" % [total]
end

main()
