/**
Inheritance: Subclass to add or override functionality
A class can inherit methods, properties, and other characteristics from another class. When one class inherits from another, the inheriting class is known as a subclass, and the class it inherits from is known as its superclass. Inheritance is a fundamental behavior that differentiates classes from other types in Swift.

Defining a Base Class
The example below defines a base class called Vehicle. This base class defines a stored property called currentSpeed, with a default value of 0.0 (inferring a property type of Double). The currentSpeed property’s value is used by a read-only computed String property called description to create a description of the vehicle.

The Vehicle base class also defines a method called makeNoise. This method doesn’t actually do anything for a base Vehicle instance, but will be customized by subclasses of Vehicle later on
*/
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
       // make a noise
      print("no noise") 
    }
}
// create a new instance of Vehicle
let someVehicle = Vehicle()
someVehicle.currentSpeed = 20.0
// access its description property
print("Vehicle: \(someVehicle.description)")
// Vehicle: traveling at 20.0 miles per hour

/**
Defines a subclass called Bicycle, with a superclass of Vehicle:
The new Bicycle class automatically gains all of the characteristics of Vehicle, such as its currentSpeed and description properties and its makeNoise() method.

In addition to the characteristics it inherits, the Bicycle class defines a new stored property, hasBasket, with a default value of false (inferring a type of Bool for the property).

By default, any new Bicycle instance you create will not have a basket. You can set the hasBasket property to true for a particular Bicycle instance after that instance is created:
*/
class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
// hasBasket property to true
bicycle.hasBasket = true
print("Bicycle: \(bicycle.hasBasket)")
// modify the inherited currentSpeed property of a Bicycle instance,
// and query the instance’s inherited description property:
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
// Bicycle: traveling at 15.0 miles per hour


/**
Subclasses can themselves be subclassed. 
creates a subclass of Bicycle for a two-seater bicycle known as a “tandem”:
Tandem inherits all of the properties and methods from Bicycle,
which in turn inherits all of the properties and methods from Vehicle.
The Tandem subclass also adds a new stored property called currentNumberOfPassengers, with a default value of 0
*/
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

// an instance of Tandem, it can work with any of its new and inherited properties, 
// and query the read-only description property it inherits from Vehicle:
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Basket: \(tandem.hasBasket)")
print("Passengers: \(tandem.currentNumberOfPassengers)")
print("Tandem: \(tandem.description)")
// Tandem: traveling at 22.0 miles per hour
print("--------------------------------")

/**
The override keyword also prompts the Swift compiler to check that your overriding class’s superclass
(or one of its parents) has a declaration that matches the one you provided for the override. 
This check ensures that your overriding definition is correct.

* * Accessing Superclass Methods, Properties, and Subscripts
When you provide a method, property, or subscript override for a subclass, it’s sometimes useful to use the existing superclass implementation as part of your override. For example, you can refine the behavior of that existing implementation, or store a modified value in an existing inherited variable.

Where this is appropriate, you access the superclass version of a method, property, or subscript by using the super prefix:
An overridden method named someMethod() can call the superclass version of someMethod() by calling super.someMethod() within the overriding method implementation.

An overridden property called someProperty can access the superclass version of someProperty as super.someProperty within the overriding getter or setter implementation.
An overridden subscript for someIndex can access the superclass version of the same subscript as super[someIndex] from within the overriding subscript implementation.
*/

/**
* * Overriding Methods
You can override an inherited instance or type method to provide a tailored 
or alternative implementation of the method within your subclass.
The following defines a new subclass of Vehicle called Train,
which overrides the makeNoise() method that Train inherits from Vehicle:
*/
class Train: Vehicle {
    override func makeNoise() {
        print("Choose Choose")
    }
}

// A new instance of Train and call its makeNoise() method, 
// The Train subclass version of the method is called:
let train = Train()
train.makeNoise()
// Choose Choose

/**
** Overriding Properties
You can override an inherited instance or type property to provide your own custom getter and setter for that property, or to add property observers to enable the overriding property to observe when the underlying property value changes.

** Overriding Property Getters and Setters
You can provide a custom getter (and setter, if appropriate) to override any inherited property, regardless of whether the inherited property is implemented as a stored or computed property at source. The stored or computed nature of an inherited property isn’t known by a subclass — it only knows that the inherited property has a certain name and type. You must always state both the name and the type of the property you are overriding, to enable the compiler to check that your override matches a superclass property with the same name and type.

You can present an inherited read-only property as a read-write property by providing both a getter and a setter in your subclass property override. You can’t, however, present an inherited read-write property as a read-only property.
*/

// ** Overriding Properties
// Defines a new class called Car, which is a subclass of Vehicle.
// The Car class introduces a new stored property called gear, with a default integer value of 1.
// The Car class also overrides the description property it inherits from Vehicle,
// to provide a custom description that includes the current gear:
// The override of the description property starts by calling super.description, 
// which returns the Vehicle class’s description property. 
// The Car class’s version of description then adds some extra text onto the end 
// of this description to provide information about the current gear.
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}


// An instance of the Car class and set its gear and currentSpeed properties,
// its description property returns the tailored description defined within the Car class:
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// Car: traveling at 25.0 miles per hour in gear 3


// ** Overriding Property Observers
// Defines a new class called AutomaticCar, which is a subclass of Car. 
// The AutomaticCar class represents a car with an automatic gearbox, 
// which automatically selects an appropriate gear to use based on the current speed:
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4


/**
Preventing Override

You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript).

Any attempt to override a final method, property, or subscript in a subclass is reported as a compile-time error. Methods, properties, or subscripts that you add to a class in an extension can also be marked as final within the extension’s definition. For more information, see Extensions.

You can mark an entire class as final by writing the final modifier before the class keyword in its class definition (final class). Any attempt to subclass a final class is reported as a compile-time error.
*/