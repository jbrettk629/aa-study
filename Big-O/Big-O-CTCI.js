// Example 1 - the following code runs in O(2N) time since we need to run through the array twice, which reduces to O(N)
function foo(arr){
    let sum = 0;
    let product = 1;

    for ( let i = 0; i < arr.length; i++) {
        sum += arr[i];
    }

    for ( let i = 0; i < arr.length; i++) {
        sum += arr[i];
    }
    console.log(sum + "," + product)
}

// Example 2 - this example runs in O(N^2) time because for each element in the array we have run through the array once.

function printPairs(arr){
    for( let i = 0; i < arr.length; i++){
        for( let j = 0; j < arr.length; j++){
            console.log(arr[i] + "," + arr[j]);
        }
    }
}

// Example 3 - O(N^2), even though the nexted loop starts at i+1
function printUnorderedPairs(arr){
    for (let i = 0; i < arr.length; i++){
        for ( let j = i + 1; j < arr.length; j++){
            console.log(arr[i] + "," + arr[j]);
        }
    }
}

// Example 4 - the runtime is O(NM), since there are two different arrays and for each element is one array,we run through each element in the other array

function printUnorderedPairs(arr1, arr2){
    for (let i = 0; i < arr1.length; i++){
        for (let j = 0; j < arr2.length; j++){
            if (arr1[i] < arr2[j]){
                console.log(arr[i] + "," + arr2[j]);
            }
        }
    }
}

// Example 5 - What is strange about this bit of code? There is a third nested loop which runs for a length of a constant (100,000). Since constants get dropped from Big-O analysis, the runtime is still just O(NM)

function printUnorderedPairs(arr1, arr2){
    for (let i = 0; i< arr1.legth; i++){
        for( let j = 0; j < arr2; j++){
            for (let k = 0; k < 100000; k++){
                console.log(arr[i] + "," + arr[j]);
            }
        }
    }
}

// Example 6 - Even though the function only runs through half of the array, we still drop the constants and it runs in O(N) time

function reverse(arr){
    for (let i=0; i < arr.length/2; i++){
        let other = arr.length - i - 1;
        let temp = arr[i];
        arr[i] = arr[other];
        arr[other] = temp;
    } 
}

// Example 7 - Which of the following are equivalent to O(N)time?
// O(N + P), where P < n/2 - YES, since we know that P is less than N/2, it is not a dominant term, therefore we can drop it
// O(2N) - YES, we drop the constant and this gets reduced to O(N)
// O(N + logN) - YES, we drop the non-dominant terms, so logN gets dropped
// O(N + M) - NO, becuase we do not know the relationship between the two

// Example 8 - What would the runtime be of a function that took in an array of strings, sorted each string, and then sorted the full array?
// - if s = length of longest string, and 
// - if a = length of the array
// - to sort a string takes O(s logs), done a times is O(a*(slogs))
// - to sort the strings in the array takes O(s) time to look through the string and there are O(a loga) comparisons, for a runtime of (a*s loga)
// - these get combined for O(a*s(loga + logs))


// Example 9 - the following code sums the values of all the nodes in a balanced binary search tree. What is its runtime?
function sum(node){
    if (node === null){
        return 0;
    }
    return sum(node.left) + sum(node.value) + sum(node.right);
}
// the runtime will be O(N) since it touches each node once and does the same amount of work for each node

// Example 10 - the following code checks if a number is prime by checking divisibility on the numbers less than it. What is it's runtime?

function isPrime(n){
    for (let x = 2; x*x<=n; x++){
        if (n % x === 0){
            return false
        }
    }
    return true;
}

// its runtime will be O(sqrt(n)), since it will not check past the sqrt(n)

// 