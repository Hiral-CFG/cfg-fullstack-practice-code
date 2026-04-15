// Activity 2: Modifying elements

// 1. Using index.html demo'd in the lesson 

// 2. Find and modify the existing paragraph
let promoParagraph = document.getElementById("promo"); // find by id
promoParagraph.textContent = "Get your fresh groceries here!";

// 3. Create a new paragraph element
let newParagraph = document.createElement("p"); 
newParagraph.textContent = "Fresh produce delivered daily!";

// Append the new paragraph to the body 
document.body.appendChild(newParagraph);


// Activity 3: Buy button

// Starting stock value
let stock = 5;

// Find the button element by id
let button = document.getElementById("buyButton");

// Add a click event listener to the button
button.addEventListener("click", function () {
    if (stock > 0) {
        stock--;
        console.log("Stock left:", stock);
    }

    // Bonus task: out of stock
    if (stock === 0) {
        // Create a new paragraph
        let outOfStockMessage = document.createElement("p");
        outOfStockMessage.textContent = "Out of stock";

        // Style the text in red
        outOfStockMessage.style.color = "red";

        // Add it to the page
        document.body.appendChild(outOfStockMessage);

        // Optional: disable the button
        button.disabled = true;
    }
});
