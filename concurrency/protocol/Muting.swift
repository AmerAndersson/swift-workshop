/**
Let's explore an example that demonstrates how the `mutating` keyword works in the context of a protocol instance method requirement.

Suppose we have a protocol called `Shape` that defines a method called `scale(by factor: Double)`. The goal is to create different shapes (both classes and structures) that can be scaled by a given factor. Here's how we can achieve this:
*/

// Define the Shape protocol
protocol Shape {
    var area: Double { get }
    mutating func scale(by factor: Double)
}

// Implement a class conforming to the Shape protocol
class Circle: Shape {
    var radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    var area: Double {
        return Double.pi * radius * radius
    }

    // No need to use the 'mutating' keyword here
    func scale(by factor: Double) {
        radius *= factor
    }
}

// Implement a structure conforming to the Shape protocol
struct Rectangle: Shape {
    var width: Double
    var height: Double

    var area: Double {
        return width * height
    }

    // The 'mutating' keyword is required here
    mutating func scale(by factor: Double) {
        width *= factor
        height *= factor
    }
}

// Example usage
var myCircle = Circle(radius: 5.0)
myCircle.scale(by: 1.5) // Scales the circle by a factor of 1.5

var myRectangle = Rectangle(width: 4.0, height: 3.0)
myRectangle.scale(by: 2.0) // Scales the rectangle by a factor of 2.0

print("Circle area: \(myCircle.area)")
print("Rectangle area: \(myRectangle.area)")



/*
1. The `Shape` protocol defines the `scale(by:)` method, which modifies the shape's properties.
2. The `Circle` class implements the method without using the `mutating` keyword because classes are reference types, and their methods can modify properties directly.
3. The `Rectangle` structure, being a value type, requires the `mutating` keyword for the `scale(by:)` method.
4. We create instances of both `Circle` and `Rectangle`, scale them, and compute their areas.

Remember that the `mutating` keyword is essential for modifying values within structures and enumerations, while classes handle this differently.
*/