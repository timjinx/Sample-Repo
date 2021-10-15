'use strict';

function compareNumbers(a, b) {
    return a - b;
}

function findOdd(A) {
    //happy coding!
    A = A.sort(function(a, b) {
        return a - b;
    });
    console.log(A);
    let prevone;
    let v_even = new Boolean(true);
    for ( let i = 0; i < A.length; i++) {
        if ( A[i] === prevone ) {
            v_even = Boolean(false);
        } else {
            if ( v_even === false ) {
                return (prevone);
            }
            v_even = Boolean(false);
            prevone = A[i];
        }
    }
    console.log("Fell through");
    return (prevone);
}

console.log(findOdd([1,2,2,3,3,3,4,3,3,3,2,2,1]));