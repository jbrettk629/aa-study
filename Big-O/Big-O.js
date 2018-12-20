// Example 1
function foo(arr){
    let sum = 0;
    let product = 1;

    for (let i = 0, i < arr.length, i++){
        sum+= arr[i];
    };

    for ( i = 0, i < arr.length, i++){
        sum += arr[i];
    };
    console.log(sum + "," + product)
}