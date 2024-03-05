import sys
import random
from datetime import datetime
import argparse

class Coin:
    def __init__(self):
        self.side = 0
        self.flip()

    def flip(self):
        self.side = random.choice([0, 1])

    def setValue(self, value):
        if value in [0, 1]:
            self.side = value

    def getValue(self):
        return self.side

    def __str__(self):
        if self.side == 1:
            return "Head"
        else:
            return "Tail"

class CList:
    def __init__(self, size):
        self.size = size
        self.coins = [Coin() for _ in range(size)]

    def flip(self):
        for c in self.coins:
            c.flip()

    def countheads(self):
        heads = sum(c.getValue() for c in self.coins)
        return heads

def main():
    parser = argparse.ArgumentParser(description='Flip some coins.')
    parser.add_argument("-c", "--coins", type=int, dest="ccount", required=True,
                        help="the number of coins", metavar="COINS")

    parser.add_argument("-f", "--flips", type=int, dest="flips", required=True,
                        help="the number of flips", metavar="FLIPS")

    parser.add_argument("-s", "--sort", dest="sorttype", default="key", required=False,
                        help="sort by key or value", metavar="SORTTYPE")
    args = parser.parse_args()

    if args.sorttype == "key":
        print("Sorting by key")
    elif args.sorttype == "value":
        print("Sorting by value")
    else:
        print("Unknown Sort Type, try key or value")
        sys.exit()

    startTime = datetime.now()
    hoccurs = {}

    coins = CList(args.ccount)

    for flip in range(args.flips):
        coins.flip()
        hc = coins.countheads()
        if hc in hoccurs:
            hoccurs[hc] += 1
        else:
            hoccurs[hc] = 1

    if args.sorttype == "key":
        # Sort by keys
        for key in sorted(hoccurs):
            print("Head Count %s occurs %s times" % (key, hoccurs[key]))
    else:
        # Sort by values
        for key, value in sorted(hoccurs.items(), key=lambda item: (item[1], item[0])):
            print("Head Count %s occurs %s times" % (key, value))

    print(datetime.now()-startTime)

if __name__ == "__main__":
    main()
