// Activity 1: 
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

// Activity 2
// Step 3: Create instances and use the method to display information
const car1 = new Car("Toyota", "Corolla", 2020);
const car2 = new Car("Honda", "Civic", 2018);

console.log(car1.display_car_info()); // Output: "Car: 2020 Toyota Corolla"
console.log(car2.display_car_info()); // Output: "Car: 2018 Honda Civic"


// Base class
class Car {
    constructor(make, model, year) {
        this.make = make;
        this.model = model;
        this.year = year;
    }

    display_car_info() {
        return `Car: ${this.year} ${this.make} ${this.model}`;
    }
}

// Subclass inheriting from Car
class ElectricCar extends Car {
    constructor(make, model, year, batteryCapacity) {
        // Call the parent constructor to initialize inherited properties
        super(make, model, year);
        this.batteryCapacity = batteryCapacity; // Additional property
    }

    // Method specific to ElectricCar
    estimate_range() {
        const km_per_kwh = 5; // Assumption of energy efficiency
        return this.batteryCapacity * km_per_kwh; // Estimated range in kilometers
    }
}

// Create instances and demonstrate inheritance
const electricCar1 = new ElectricCar("Tesla", "Model 3", 2021, 75); // 75 kWh battery
const electricCar2 = new ElectricCar("Nissan", "Leaf", 2019, 40); // 40 kWh battery

console.log(electricCar1.display_car_info()); // Output: "Car: 2021 Tesla Model 3"
console.log(electricCar2.display_car_info()); // Output: "Car: 2019 Nissan Leaf"

console.log(`Estimated range for ${electricCar1.make} Model 3: ${electricCar1.estimate_range()} km`); // Output: 375 km
console.log(`Estimated range for ${electricCar2.make} Leaf: ${electricCar2.estimate_range()} km`); // Output: 200 km



// Activity 3: 
// Abstract base class
class Vehicle {
    constructor(make, model, year) {
        if (new.target === Vehicle) {
            throw new Error("Vehicle is abstract and cannot be instantiated directly.");
        }

        this.make = make;
        this.model = model;
        this.year = year;
    }

    display_vehicle_info() {
        throw new Error("display_vehicle_info() must be implemented by subclass.");
    }

    estimate_range() {
        return "Range not defined for this vehicle type.";
    }
}


// Modify Car to extend Vehicle
// NOTE FOR LESSON:
// We are duplicating the Car class here so that all activities
// can run sequentially in one code file.
// Prompt students to modify the original Car class
// instead of creating a new version.
class CarV2 extends Vehicle {
    constructor(make, model, year, fuelType = "petrol") {
        super(make, model, year);
        this.fuelType = fuelType;
    }

    display_vehicle_info() {
        return `This is a ${this.year} ${this.make} ${this.model}. It is a ${this.fuelType} car.`;
    }

    estimate_range() {
        return "Typical petrol car range: ~600 km.";
    }
}


// ElectricCar extending CarV2
class ElectricCar extends CarV2 {
    constructor(make, model, year, batteryCapacity) {
        super(make, model, year, "electric");
        this.batteryCapacity = batteryCapacity;
    }

    // Override estimate_range
    estimate_range() {
        const km_per_kwh = 5;
        return `Estimated electric range: ${this.batteryCapacity * km_per_kwh} km.`;
    }

    display_vehicle_info() {
        return `This is a ${this.year} ${this.make} ${this.model}. It is an electric car.`;
    }
}


// Activity 4: 
const vehicles = [
    new CarV2("Ford", "Focus", 2018),
    new ElectricCar("Tesla", "Model 3", 2021, 75),
    new CarV2("Toyota", "Corolla", 2020),
    new ElectricCar("Nissan", "Leaf", 2019, 40)
];

vehicles.forEach(vehicle => {
    console.log(vehicle.display_vehicle_info());
    console.log(vehicle.estimate_range());
    console.log("----------------------");
});