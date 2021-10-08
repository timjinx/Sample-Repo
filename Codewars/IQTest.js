'use strict';

function iqTest(numbers) {
    let ocount = 0;
    let opos, epos;
    let ecount = 0;
    const arr = numbers.split(" ");
    for (let i = 0; i < arr.length; i++) {
        if ( arr[i] % 2 === 0 ) {
            console.log("Even");
            ecount++;
            epos = i;
        }  else {
            console.log("odd");
            ocount++;
            opos = i;
        }
    }
    return ( (ecount > ocount) ? ++opos : ++epos );
}

console.log(iqTest("1 2 1 1"));