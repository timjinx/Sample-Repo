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
$

$ f95 class_sort.f90 -o class_sort.exe

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

