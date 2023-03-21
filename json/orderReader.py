import os
import re
import json
def main () :
    filename = 'order2.json'
    with open(filename, 'r') as file1:
        orderStr = file1.read()
    orders = json.loads(orderStr)
    total = 0
    tabletotals = {}
    for order in orders:
        total = total + order['total']
        if order['table'] in tabletotals:
            tabletotals[order['table']] += order['total']
        else:
            tabletotals[order['table']] = order['total']
    for table, amount in tabletotals.items():
        print("Table {table} had a total of £{amount:0.2f} ".format(table=table, amount=amount))
    print("The grand total is £{gt:0.2f}".format(gt=total))
main()