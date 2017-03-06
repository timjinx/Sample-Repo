cat exam_results.txt | sort -t ","  -k 3r -k 1 -k 2 | awk -F ',' ' { printf "%g\t%s,%s\n", $3, $1, $2  } '
