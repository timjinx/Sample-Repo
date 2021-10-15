'use strict';

function findOdd(A) {
    //happy coding!
    let AUnique = [];
    for (let el of A) {
        if ( AUnique.indexOf(el) === -1 ) {
            AUnique.push(el);
        }
    }
    for (let el of AUnique) {
        const c = A.filter(x => x==el).length;
        if ( c % 2 === 1) {
            return el
        }
    }
    return -1;
}

console.log(findOdd([1,2,2,3,3,3,4,3,3,3,2,2,1]));