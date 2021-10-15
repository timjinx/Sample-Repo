function narcissistic(value) {
    // Code me to return true or false
    let a = value.toString();
    let nar = 0; 
    let ar = a.split('');
    for (let i = 0; i < ar.length; i++ ){
        nar = nar + (parseInt(ar[i]) ** ar.length) ;
    }
    return ( nar === value ) ? (true) : (false);
}

console.log(narcissistic(155));