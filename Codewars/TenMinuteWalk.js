function isValidWalk(walk) {
    //insert brilliant code here
    let longitude = 0;
    let latitude = 0;
    let timer = 10;
    for ( let i = 0; i < walk.length; i++ ){
        timer -= 1;
        switch ( walk[i] ) {
            case "n":
                latitude += 1;
                break;
            case "s":
                latitude -= 1;
                break;
            case "w":
                longitude += 1;
                break;
            case "e":
                longitude -= 1;
                break;
        }
    }
    return (( latitude === 0 && longitude === 0 &&  timer ===0 ) ? true : false)
}

console.log(isValidWalk(['n','s','n','s','n','s','n','s','n','s']));
console.log(isValidWalk(['w','e','w','e','w','e','w','e','w','e','w','e']));