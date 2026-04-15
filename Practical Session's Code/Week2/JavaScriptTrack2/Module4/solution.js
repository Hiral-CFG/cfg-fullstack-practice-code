// Activity 1
let age = prompt("What is your age?");
let message = '';

if (age >= 18) {
   message = 'Welcome to the website!';
} else if (age >= 13) {
   message = 'You are allowed to buy limited groceries.';
} else {
   message = 'You are too young to buy anything.';
}

console.log(message)


// Activity 2: 
// 1: Check if a user qualifies for free shipping based on basket total

// let age = prompt("What is your age?");
// let message = '';

// if (age >= 16) {
//    message = 'Welcome to the website!';
// } else if (age >= 13) {
//    message = 'You are allowed to buy limited groceries.';
// } else {
//    message = 'You are too young to buy anything.';
// }

// console.log(message)

// Activity 3: 
// let age = prompt("What is your age?");

// let hasParentalConsent = true; 
// let message = '';

// if (age >= 18) {
//    message = 'Welcome to the website!';
// } 
// // Logic for the 12-16 (or anyone over 12 but under 18) age bracket:
// else if (age >= 12) {
//    if (hasParentalConsent) {
//       message = 'You are allowed to access the website with parental consent.';
//    } else {
//       message = 'You need parental consent to access this website.';
//    }
// } 
// else {
//    message = 'You are too young to buy anything.';
// }

// console.log(message);

// Activity 4: 
// Create an array of three grocery items
const groceries = ["Butter", "Eggs", "Sugar"];

// Loop through the array and log each item with a number
for (let i = 0; i < groceries.length; i++) {
    console.log(`${i + 1}. ${groceries[i]}`);
}


// Activity 5:  
let budget = 10; // Total budget in £
const itemCost = 2; // Cost per item
let itemsBought = 0; // Counter for items bought

while (budget >= itemCost) {
    budget -= itemCost; // Deduct the cost from budget
    itemsBought++; // Increase item count
    console.log(`Bought item ${itemsBought}, remaining budget: £${budget}`);
}

console.log(`Shopping done! Total items bought: ${itemsBought}`);