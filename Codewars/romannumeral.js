'use strict';

function solution(number) {
    let result = '';
    while (number >= 1000 ) {
        result = result + 'M';
        number -= 1000;
    }
    while (number >= 900 ) {
        result = result + 'CM';
        number -= 900;
    }
    while (number >= 500 ) {
        result = result + 'D';
        number -= 500;
    }
    while (number >= 400 ) {
        result = result + 'CD';
        number -= 400;
    }
    while (number >= 100 ) {
        result = result + 'C';
        number -= 100;
    }
    while (number >= 90 ) {
        result = result + 'XC';
        number -= 90;
    }
    while (number >= 50 ) {
        result = result + 'L';
        number -= 50;
    }
    while (number >= 40 ) {
        result = result + 'XL';
        number -= 40;
    }
    while (number >= 10 ) {
        result = result + 'X';
        number -= 10;
    }
    while (number >= 9 ) {
        result = result + 'IX';
        number -= 9;
    }
    while (number >= 5 ) {
        result = result + 'V';
        number -= 5;
    }
    while (number >= 4 ) {
        result = result + 'IV';
        number -= 4;
    }
    while (number >= 1 ) {
        result = result + 'I';
        number -= 1;
    }
    return (result);n
}

console.log(solution(1990));