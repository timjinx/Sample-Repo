document.getElementById("mycheck").addEventListener("click", myCompare());
document.getElementById("myclear").addEventListener("click", myClear());
// document.getElementById("myclear").onclick = function() {myClear()};
function myCompare() {
    let v1 = document.getElementById("num1").value;
    let v2 = document.getElementById("num2").value;
    let mymessage = 'Blank';
    if ( v1 > v2 ) {
        mymessage = "The first number is greater than the second number";
    } else if ( v2 > v1 ) {
        mymessage = "The second number is greater than the first number";
    } else {
        mymessage = "The numbers are the same";
    }
    document.getElementById("myresult").innerHTML = mymessage;
}
function myClear() {
    document.getElementById("myresult").innerHTML = "";
}