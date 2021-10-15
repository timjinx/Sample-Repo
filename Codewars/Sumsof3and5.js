function solution(number){
  let total = 0;
  for (let i = 1; i < number; i++ ) {
      if (( i % 3 === 0) || ( i % 5 === 0)) total += i;
  }
  return (( number >=  0 ) ? total : 0) ;
}

console.log(solution(0));
console.log(solution(10));
console.log(solution(30));
console.log(solution(-10));