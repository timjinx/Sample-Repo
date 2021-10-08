'use strict';
// [[18, 20],[45, 2],[61, 12],[37, 6],[21, 21],[78, 9]]

function openOrSenior(data){
    let membershipList=[];
    data.forEach(v_member => {
        // console.log(v_member)
        if ( v_member[0] >= 55 && v_member[1] > 7 ) {
            membershipList.push("Senior");
        } else {
            membershipList.push("Open");
        }
    });
    return(membershipList);
}

console.log(openOrSenior([[18, 20],[45, 2],[61, 12],[37, 6],[21, 21],[78, 9]]));

console.log(openOrSenior([[45, 12],[55,21],[19, -2],[104, 20]]));