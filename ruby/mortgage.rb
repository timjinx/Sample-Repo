#coding: utf-8
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: mortage.rb [options]"

  opts.on("-a", "--amount [AMOUNT]", "Amount borrowed") do |a| 
     options[:amount] = a.to_i
  end
  opts.on("-r", "--rate [RATE]", "Interest rate") do |r| 
     options[:rate] = r.to_f
  end
  opts.on("-d", "--duration [DURATION]", "Loan duration in years") do |d| 
     options[:duration] = d.to_i
  end
end.parse!

v_rm = options[:rate] / 12
v_dm = options[:duration].to_i * 12
v_amount = options[:amount].to_f

top_line = v_amount * v_rm * (( 1 + (v_rm / 100))**v_dm) 
bottom_line = 100 * (( (1 + ( v_rm / 100 ))**v_dm) -1)
mp = top_line / bottom_line
ap = mp * 12
printf "The amount borrowed is £%0.2f\n", v_amount.round(2)
printf "The interest rate is %s\%\n", options[:rate].to_s
printf "The loan duration is %s years\n", options[:duration].to_s
printf "Annual repayments will be £%0.2f\n", ap.round(2)
printf "Monthly repayments will be £%0.2f\n", mp.round(2)
printf "Total cost of loan will be £%0.2f\n", (ap * options[:duration]).round(2)
