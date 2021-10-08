'use strict';

function findOutlier(integers) {
    let ofound;
    let efound;
    let ocnt = 0;
    let ecnt = 0;
    for (let el of integers) {
        if ( el % 2 === 1 ) {
            ofound = el;
            ocnt++;
        } else {
            efound = el;
            ecnt++;
        }
    }
    return ( (ocnt > ecnt) ? efound : ofound );
}

console.log(`The outlier is ${findOutlier([1, 6, 3, 5, 7])}`);
console.log(`The outlier is ${findOutlier([2, 6, 34, 5, 8])}`);