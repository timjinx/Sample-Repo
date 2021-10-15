

function alphabetPosition(text) {
    let v_output = '';
    let arr = text.toLowerCase().replace(/[^a-z]/g, '').split("");
    for (let i=0; i<arr.length; i++) {
        v_output = v_output + (arr[i].charCodeAt(0) - 96 ) + " ";
    }
    return v_output.trim();
}

console.log(alphabetPosition("The sunset sets at twelve o' clock."));
