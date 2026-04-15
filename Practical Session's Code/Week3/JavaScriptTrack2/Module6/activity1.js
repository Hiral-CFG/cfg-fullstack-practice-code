// Step 1: Define the Car class
class Car {
    constructor(make, model, year) {
        // Initialize properties
        this.make = make;
        this.model = model;
        this.year = year;
    }

    // Step 2: Add a method to display car information
    display_car_info() {
        return `Car: ${this.year} ${this.make} ${this.model}`;
    }
}

// Step 3: Create instances and use the method to display information
const car1 = new Car("Toyota", "Corolla", 2020);
const car2 = new Car("Honda", "Civic", 2018);

console.log(car1.display_car_info()); // Output: "Car: 2020 Toyota Corolla"
console.log(car2.display_car_info()); // Output: "Car: 2018 Honda Civic"
