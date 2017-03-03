The plan was to write a Fortran program that would read a text file of exam results, sort them by grade, and then by name,
and then print them out. I demonstrate what I was aiming for with a bit of shell, a sort and an awk statement

$ cat exam_results.txt
Woodward,Jackie,71.2
Jinkerson,Tim,75.0
Jinkerson,Stephanie,82.4
Smith,Jackie,71.2
Brown,Alex,67.2
Smith,Cathy,72.3
Jinkerson,Catherine,81.7
Smith,Boyd,71.2
Jinkerson,Neil,67.2

tjinkers@TJINKERS-LAP ~/fortran/sort
$

$ cat exam_results.txt | sort -t ","  -k 3r -k 1 -k 2 | awk -F ',' ' { printf "%g\t%s,%s\n", $3, $1, $2  } '
82.4    Jinkerson,Stephanie
81.7    Jinkerson,Catherine
75      Jinkerson,Tim
72.3    Smith,Cathy
71.2    Smith,Boyd
71.2    Smith,Jackie
71.2    Woodward,Jackie
67.2    Brown,Alex
67.2    Jinkerson,Neil

tjinkers@TJINKERS-LAP ~/fortran/sort
$ ./class_sort.exe -f exam_results.txt
 82.4   Jinkerson, Stephanie
 81.7   Jinkerson, Catherine
 75.0   Jinkerson, Tim
 72.3   Smith, Cathy
 71.2   Smith, Boyd
 71.2   Smith, Jackie
 71.2   Woodward, Jackie
 67.2   Brown, Alex
 67.2   Jinkerson, Neil

tjinkers@TJINKERS-LAP ~/fortran/sort
$

This was the first code I wrote in Fortran using Subroutines, Functions, non-global variables, etc.

