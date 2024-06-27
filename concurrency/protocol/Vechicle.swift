// Vehicle protocol with two required methods: estimateTime(for:) and travel(distance:).
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
    func openSunroof() 
}

// Implement the required methods within the conforming type
struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        return distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance) km.")
    }
    
    func openSunroof() {
        print("Sunroof is now open!")
    }
}

// Example usage
let myCar = Car()
myCar.travel(distance: 100) // Output: I'm driving 100
myCar.openSunroof() // Output: Sunroof is now open!
print(myCar.estimateTime(for: 100)) // Output: 2
print("---------------------------------")