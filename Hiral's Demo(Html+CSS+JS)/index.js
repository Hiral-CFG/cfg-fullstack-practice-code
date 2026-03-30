// =========================
// DOM MANIPULATION
// =========================

// Add new element
function addElement() {
    const newDiv = document.createElement("div");

    newDiv.textContent = "Hello, I was added using JavaScript!";

    newDiv.style.color = "blue";

    document.getElementById("dom-output").appendChild(newDiv);
}

// Change heading text
function changeText() {
    const heading = document.getElementById("main-heading");

    heading.textContent = "Text Changed using JavaScript!";
}

// Remove element
function removeElement() {
    const element = document.getElementById("style-text");

    if (element) {
        element.remove();
    }
}

// =========================
// STYLE USING JS
// =========================

function changeStyle() {
    const text = document.getElementById("style-text");

    if (text) {
        text.style.backgroundColor = "purple";
        text.style.color = "white";
        text.style.padding = "10px";
    }
}

// =========================
// EVENT LISTENERS
// =========================

// Get button
const button = document.getElementById("eventBtn");

// Click event
button.addEventListener("click", function () {
    document.getElementById("event-output").textContent =
        "Button clicked! Event listener worked 🎉";
});

// Mouse out event
button.addEventListener("mouseout", function () {
    document.getElementById("event-output").style.background = "lightpink";
});