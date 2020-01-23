# -*- coding: utf-8 -*-
from optparse import OptionParser
import math
def main () :
    parser = OptionParser()
    parser.add_option("-a", "--amount", dest="amount",
                      help="the amount to be borrowed", metavar="AMOUNT")
    parser.add_option("-i", "--interest", dest="interest",
                      help="the annual interest rate", metavar="INTEREST")
    parser.add_option("-d", "--duration", dest="duration",
                      help="Duration of the loan, in years", metavar="DURATION")
    (options, args) = parser.parse_args()
    if not options.amount :
       print("You must specify an amount")
       exit(-1)
    if not options.interest :
       print("You must specify an interest rate")
       exit(-1)
    if not options.duration :
       print("You must specify an duration")
       exit(-1)
    v_amount = int(options.amount)
    v_interest = float(options.interest)
    v_duration = int(options.duration)
    monthly_interest = float(v_interest) / 12
    duration_in_months = v_duration * 12
    top_line = ( v_amount * monthly_interest * ( 1 + ( monthly_interest / 100 ))**duration_in_months );
    bottom_line = 100 * (( (1 + ( monthly_interest / 100 ))**duration_in_months) -1);
    monthly_payment = top_line / bottom_line ;
    annual_payment = monthly_payment * 12;
    print("The amount borrowed is " +  chr(163) + "%0.2f" % (v_amount))
    print("The interest rate is {:.2f}".format(v_interest))
    print("The loan duration is {:0>2d} years".format(v_duration))
    print("Annual replayments will be " +  chr(163) + "%0.2f" % (annual_payment,))
    print("Monthly replayments will be " +  chr(163) + "%0.2f" % (monthly_payment,))
    print("Total cost of loan will be " +  chr(163) + "%0.2f" % (annual_payment * v_duration))

main()
