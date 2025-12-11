import sys
import random
from datetime import datetime
import time # Used for potential future delays, though not strictly needed here

class Coin :
    def __init__(self) :
        self.side = 0
        self.flip()

    def flip(self) :
        # random.choice is cleaner than Random(2) used in the Pascal version
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
        self.coins = []
        for i in range(size) :
            self.coins.append(Coin())

    def flip(self) :
        for c in self.coins :
            c.flip()

    def countheads(self) :
        heads = 0
        for c in self.coins :
            heads += c.getValue()
        return heads

def main() :
    # Python 3 uses input() instead of raw_input()
    try :
        ccount = int(input("How many Coins? "))
    except ValueError :
        print("Not a number")
        sys.exit()

    try :
        fcount = int(input("How many Flips? "))
    except ValueError :
        print("Not a number")
        sys.exit()

    startTime = datetime.now()
    hoccurs = {}
    coins = CList(ccount)

    for flip in range(fcount) :
        coins.flip()
        hc = coins.countheads()
        
        # Python 3: Using .get(key, default) or better yet, the dict.get() method with assignment,
        # or collections.defaultdict, but for simplicity here, we use .get().
        # Even simpler: use the default value assignment when accessing a key (Python 3.4+)
        # Or collections.Counter() if available.
        
        # Simple, reliable Python 3 idiom for incrementing a dictionary count:
        hoccurs[hc] = hoccurs.get(hc, 0) + 1


    for num, oc in hoccurs.items() :
        # Python 3 requires parentheses around print arguments
        print("Head Count", num, "occurs", oc, "times")
        
    print(datetime.now() - startTime)

if __name__ == "__main__":
    main()
