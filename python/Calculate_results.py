import os
import re    
       
def main():
    afile = open("Answers.csv", "r")
    answers = ["x","x"]
    for line in afile:
        a = line.rstrip().split(',')
        answers.append(a[1])

    afile.close()

    winner = ''
    hiscore = 0
    entries = 0

    infile = open("The Great EV Christmas Tree Competition of 2022.csv","r")
    for line in infile:
        a = line.rstrip().split(',')
        for x in range(len(a)):
            a[x] = a[x].strip('"') 
        emp =  a[1]
        if emp == 'Username':
            continue
        entries += 1
        score = 0
        for x in range(1,18):
            if a[x] == answers[x]:
                score += 1
        print(emp, score)
        if score > hiscore:
            hiscore = score
            winner = emp
    print("We had", entries, "entries")
    print("The winner is", winner, "with a score of", hiscore)
        

if __name__ == "__main__":
    main()
