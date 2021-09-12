let day = 'sunday';

switch (day) {
    case 'monday':
        console.log('Do Monday things');
        break;
    case 'tuesday':
        console.log('Do Tuesday things');
        break;
    case 'wednesday':
    case 'thursday':
        console.log("Do midweek things");
        break;
    case 'friday':
        console.log('Do friday things');
        break;
    case 'saturday':
    case 'sunday':
        console.log('Do weekend things');
        break;
    default:
        console.log("Not a valid day");
}

if (day === 'monday') {
    console.log('Do Monday things');
} else if (day === 'tuesday') {
    console.log('Do Tuesday things');
} else if ((day === 'wednesday') || (day == 'thursday')) {
    console.log("Do midweek things");
} else if (day === 'friday') {
    console.log('Do friday things');
} else if ((day === 'saturday') || (day === 'sunday')) {
    console.log('Do weekend things');
} else {
    console.log("Not a valid day");
}

