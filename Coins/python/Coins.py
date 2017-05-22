import sys
import random
from datetime import datetime
from optparse import OptionParser
class Coin :
    def __init__(self) :
        self.side = 0
        self.flip()

    def flip(self) :
        self.side = random.choice([0,1])

    def setValue(self, value) :
        if value in [0,1] :
            self.side = value

    def getValue(self) :
        return self.side

    def __str__(self) :
        if self.side == 1 :
            return "Head"
        else :
            return "Tail"
class CList() :
    def __init__ (self, size) :
        self.size = size
        self.coins=[]
        for i in range(size) :
            self.coins.append(Coin())
    def flip(self) :
        for c in self.coins :
            c.flip()
    def countheads(self) :
        heads=0
        for c in self.coins :
            heads += c.getValue()
        return heads

def main() :
    parser = OptionParser()
    parser.add_option("-c", "--coins", dest="ccount",
           help="the number of coins", metavar="COINS")
    parser.add_option("-f", "--flips", dest="flips",
           help="the number of flips", metavar="FLIPS")
    (options, args) = parser.parse_args()
    try :
        ccount = int(options.ccount)
    except ValueError :
        print "Not a number"
        sys.exit()

    try :
        fcount = int(options.flips)
    except ValueError :
        print "Not a number"
        sys.exit()

    startTime = datetime.now()
    hoccurs = {}

    coins=CList(ccount)

    for flip in range(fcount) :
        coins.flip()
        hc = coins.countheads()
        if hoccurs.has_key(hc) :
            hoccurs[hc] = hoccurs.get(hc) + 1
        else :
            hoccurs[hc] = 1

    for key in sorted(hoccurs.iterkeys()):
        print "Head Count %s occurs %s times" % (key, hoccurs[key])

    print(datetime.now()-startTime)

main()

