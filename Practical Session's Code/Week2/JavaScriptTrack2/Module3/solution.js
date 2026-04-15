// Activity 2:

// 1. Create a variable for the username
let userName = "Sarah"; 

// 2. Create a variable for the basket total cost 
let basketTotal = 100; 

// 3. Log the welcome message to the console 
console.log("Welcome " + userName + ", your basket is currently at £" + basketTotal + ". Would you like to check out?");


// Activity 3: 

// 1. Create an array called basketItems with 3 values 
let basketItems = ['apples', 'eggs', 'milk'];

// 2. Calculate the length of the array using .length
let basketLength = basketItems.length;

// 3. Output how many items are in the basket 
console.log("You have " + basketLength + " items in your basket.");

// 4. Add another item using .push() and output the new total 
basketItems.push('bread');
console.log("You have added an item. You now have " + basketItems.length + " items in your basket.");

// 5. Add and remove some other items
basketItems.pop(); 
console.log("An item was removed. The items left are: " + basketItems);

// basketItems.push('....');
// console.log("You have added an item. You now have " + basketItems.length + " items in your basket.");

// --- Activity 4: 

// 1. Update the total with a shipping fee
basketTotal = basketTotal + 5.99; 

// 2. Access the first item
console.log(`The first item in your basket is ${basketItems[0]}.`);

// 3. Output the final summary
console.log(`Hi ${userName}, you have ${basketItems.length} items in your basket. Your final total including shipping is £${basketTotal}.`);