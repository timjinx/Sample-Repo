from datetime import datetime
def main() :
    print "This program finds the largest prime number small than a given number"
    try :
        maxno = int(raw_input("What is the largest number to be considered? "))
    except ValueError :
        print "Not a number"
        sys.exit()
    if maxno < 3 :
        print "The minimum useable number is 3"
        exit()

    startTime = datetime.now()
    numbers = [2] + range(3, maxno+1, 2)
    print "Finding the largest prime number smaller than " + str(maxno)
    result = []
    while len(numbers) > 0 :
        result.append(numbers[0])
        curr = numbers[0]
        for n in numbers :
            if n % curr == 0 :
                numbers.remove(n)
    print result[-1] , " is a prime number"

    if result[-1] < maxno :
        print "There are " + str(len(result)) + " prime numbers smaller than " + str(maxno)
    else :
        print "There are " + str(len(result)) + " prime numbers up to, and including " + str(maxno)
        
    endTime = datetime.now()
    print "Start time\t" + str(startTime)
    print "End time\t" + str(endTime)
    print "Total time\t" + str(endTime - startTime)

main()
