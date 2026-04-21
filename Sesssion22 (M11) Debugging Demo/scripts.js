// function calculateSum(numbers) {
//     let sum = 0; 

//     console.log("Starting sum calculation"); // Initial log message

//     for (let i = 0; i < numbers.length; i++){
//         console.log(`Adding ${numbers[i]} to sum`);
//         sum += numbers[i];
//     }

//     console.log("Total sum:" , sum);// Log final sum
//     return sum;
// }

// const numbers = [10,20,30,40];
// calculateSum(numbers);// Expected output: "Starting sum calculation", "Adding 10 to sum", etc.




// function squardNumbers(numbers){
//     let squared = [];

//     for (let i = 0 ; i < numbers.length; i++){
//         debugger; // pauses code execution here
//         squared.push(numbers[i] ** 2);
//     }

//     return squared; 
// }

// const input = [1,2,3,4,5];
// console.log("Squared numbers ", squardNumbers(input));




// function findMax(numbers){
//     let max = -Infinity;

//     for (let i = 0 ; i < numbers.length; i++){
//         // Set a breakpoint here to see the live values of numbers and max
//         if (numbers[i] > max){
//             max = numbers[i];
//         }
//     }

//     return max; 
// }

// const values = [5,10,3,8,15];
// console.log("Maximum value: ", findMax(values));//Expected output 15


//What can go wrong!
//1. Format Changed!
// {
//   "name": "Jack",
//   "age": 25
// }
// console.log(user.name);

// {
//   "fullName": "Jack",
//   "age": 25
// }
// console.log(user.name); //Error!




//2. Missing Data 
const user = null;

console.log(user.name); // = crash
// Instead
//Try will run the code, and if something breaks, catch handles the error instead of crashing.
try {
    const user = null;
    console.log(user.name);
} catch (error) {
    console.log("Something went wrong:", error.message);
}


//3. Custom Errors (validate data)
function greetUser(user) {
    if (!user || !user.name) {
        throw new Error("User name is required");
    }

    console.log("Hello " + user.name);
}

//When calling that function, handle the exception if any
//Because we have created our own error when required data was missing!
try {
    greetUser(null);
} catch (error) {
    console.log(error.message);
}


//4. An incomplete API responce 
function processData(data) {
    try {
        if (!data.name) {
            throw new Error("Missing name in API response");
        }

        console.log("Name:", data.name);
    } catch (error) {
        console.log("Error:", error.message);
    }
}



//try...catch intercepts runtime exceptions — errors that occur during execution that weren't expected
//  or couldn't be prevented early.
//while throw with a custom error is like an early exit; you validate data,
// determine it's invalid, and reject it before we consume it in laters steps in our code and produce corrupt results

//catch is reactive, throw is preventive. They operate at different points in the control flow and serve different failure modes.

