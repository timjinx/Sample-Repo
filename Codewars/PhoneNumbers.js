'use strict';
function extractNumbers(pno, start, end) {
    let result = '';
    for ( let i = start; i <= end; i++) {
        result = result + pno[i];
    }
    return result;
}
function createPhoneNumber(pno) {
    return (`(${extractNumbers(pno,0,2)}) ${extractNumbers(pno,3,5)}-${extractNumbers(pno,6,9)}`);
}

console.log(createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]));
