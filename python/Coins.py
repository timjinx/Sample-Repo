import sys
import random
from datetime import datetime
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
    try :
        ccount = int(raw_input("How many Coins? "))
    except ValueError :
        print "Not a number"
        sys.exit()

    try :
        fcount = int(raw_input("How many Flips? "))
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
    for num, oc in hoccurs.items() :
        print "Head Count ", num, " occurs ", oc, " times"
    print(datetime.now()-startTime)

main()

