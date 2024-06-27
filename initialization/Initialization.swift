
/**
* * Initialization: 
Set the initial values for a type’s stored properties and perform one-time setup

** Setting Initial Values for Stored Properties
Classes and structures must set all of their stored properties to an appropriate initial value 
by the time an instance of that class or structure is created. 
Stored properties can’t be left in an indeterminate state.

You can set an initial value for a stored property within an initializer,or 
by assigning a default property value as part of the property’s definition.
These actions are described in the following sections.

* * Note

When you assign a default value to a stored property, or set its initial value within an initializer, 
the value of that property is set directly, without calling any property observers.

Defines a new structure called Fahrenheit to store temperatures expressed in the Fahrenheit scale.
The Fahrenheit structure has one stored property, temperature, which is of type Double
The structure defines a single initializer, init, with no parameters, 
which initializes the stored temperature with a value of 32.0 
(the freezing point of water in degrees Fahrenheit)
*/

// set its initial value within an initializer
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// Prints "The default temperature is 32.0° Fahrenheit"

/**
* * Default Property Values
You can set the initial value of a stored property from within an initializer, as shown above.
Alternatively, specify a default property value as part of the property’s declaration. 
You specify a default property value by assigning an initial value to the property when it’s defined.
You can write the Fahrenheit structure from above in a simpler form by providing a 
default value for its temperature property at the point that the property is declared:
*/

// Default value for its temperature property at the point that the property is declared
struct FahrenheitDegrees {
    var temperature = 32.0
  
}
var degrees = FahrenheitDegrees()
print("The default temperature is \(degrees.temperature)° Fahrenheit")
// Prints "The default temperature is 32.0° Fahrenheit"  

/**
** Customizing Initialization
** Initialization Parameters

You can provide initialization parameters as part of an initializer’s definition,
to define the types and names of values that customize the initialization process. 
Initialization parameters have the same capabilities and syntax as function and method parameters.

The following defines a structure called Celsius, which stores temperatures expressed in degrees Celsius. 
The Celsius structure implements two custom initializers called init(fromFahrenheit:) and init(fromKelvin:),
which initialize a new instance of the structure with a value from a different temperature scale.
*/
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    // An underscore (_) without the need for an argument label
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
print("The default temperature is \(boilingPointOfWater.temperatureInCelsius)° FromFahrenheit")


let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0
print("The default temperature is \(freezingPointOfWater.temperatureInCelsius)° FromKelvin")

// calling without the need for an argument label
let bodyTemperature = Celsius(37.0)
print("The default temperature is \(bodyTemperature.temperatureInCelsius)° Celsius")
// bodyTemperature.temperatureInCelsius is 37.

// Both initializers convert their single argument into the corresponding 
// Celsius value and store this value in a property called temperatureInCelsius.
print("----------------------------------------------")

/**
The following example defines a structure called Color,
with three constant properties called red, green, and blue. 
These properties store a value between 0.0 and 1.0 
to indicate the amount of red, green, and blue in the color.

Color provides an initializer with three appropriately 
named parameters of type Double for its red, green, and blue components. 
Color also provides a second initializer with a single white parameter, 
which is used to provide the same value for all three color components
*/
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}
// Both initializers can be used to create a new Color instance,
// by providing named values for each initializer parameter:
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
print("The default color is \(magenta)")
print("The default color is \(halfGray)")
print("----------------------------------------------")

class Wall { 
    var length: Double
    var height: Double
    
    init(length: Double, height: Double) {
        self.length = length
        self.height = height
    }
    
    func calculateArea() -> Double {
        return length * height
    }
}

// Create objects and initialize data members
var wall1 = Wall(length: 10.5, height: 8.6)
var wall2 = Wall(length: 8.5, height: 6.3)

print("Area of Wall 1:", wall1.calculateArea())
print("Area of Wall 2:", wall2.calculateArea())

/**
* Optional Property Types
Properties of optional type are automatically initialized with a value of nil, 
indicating that the property is deliberately intended to have “no value yet” during initialization.
The following defines a class called SurveyQuestion, with an optional String property called response:
*/
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."
print(cheeseQuestion.response!)
// Prints "Yes, I do like cheese."
// The response to a survey question can’t be known until it’s asked,
// and so the response property is declared with a type of String?, or “optional String”. 
// It’s automatically assigned a default value of nil, meaning “no string yet”, 
// when a new instance of SurveyQuestion is initialized.
print("----------------------------------------------")

class SurveyQuestions {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestions(text: "How about beets?")
beetsQuestion.ask()
// Prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"
print(beetsQuestion.response!)

/**
Default Initializers
Swift provides a default initializer for any structure or class that provides default values for all of its properties and doesn’t provide at least one initializer itself. The default initializer simply creates a new instance with all of its properties set to their default values.
*/

// The following defines a class called ShoppingListItem, 
// which encapsulates the name, quantity, and purchase state of an item in a shopping list:
// The code uses the default initializer for the ShoppingListItem class to create a new instance 
// of the class with initializer syntax, written as ShoppingListItem(), and assigns this new instance to a variable called item
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false

    var description: String {
        var output = "\(quantity) x \(name ?? "[Unnamed]")"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [ShoppingListItem()]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}
print("----------------------------------------------")

/**
Memberwise Initializers for Structure Types
The following defines a structure called Size with two properties called width and height.
Both properties are inferred to be of type Double by assigning a default value of 0.0.
The Size structure automatically receives an init(width:height:) memberwise initializer,
which you can use to initialize a new Size instance:
*/
struct Sizes {
    var width = 0.0, height = 0.0
}
let twoByTwo = Sizes(width: 3.0, height: 3.0)
print(twoByTwo.width, twoByTwo.height)

//  You can omit either property or both properties, and the initializer uses the default value for anything you omit.
let zeroByTwo = Sizes(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)
// Prints "0.0 2.0"


let zeroByZero = Sizes()
print(zeroByZero.width, zeroByZero.height)
// Prints "0.0 0.0"
print("----------------------------------------------")

/**
Initializer Delegation for Value Types
Initializers can call other initializers to perform part of an instance’s initialization. 
This process, known as initializer delegation, avoids duplicating code across multiple initializers.

For value types, you use self.init to refer to other initializers from the same value type when writing your own custom initializers. You can call self.init only from within an initializer.

Note that if you define a custom initializer for a value type, you will no longer have access to the default initializer (or the memberwise initializer, if it’s a structure) for that type. This constraint prevents a situation in which additional essential setup provided in a more complex initializer is accidentally circumvented by someone using one of the automatic initializers.
*/

// The following example defines a custom Rect structure to represent a geometric rectangle. 
// The code requires two supporting structures called Size and Point, 
// both of which provide default values of 0.0 for all of their properties:
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

/**
You can initialize the Rect structure below in one of three ways —
by using its default zero-initialized origin and size property values,
by providing a specific origin point and size, or by providing a specific center point and size. 
These initialization options are represented by three custom initializers that are part of the Rect structure’s definition:
*/
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
   init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    } 
}
let basicRect = Rect()
// basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)
print(basicRect.origin, basicRect.size)

let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))
// originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)
print(originRect.origin, originRect.size)

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)
print(centerRect.origin, centerRect.size)
print("----------------------------------------------")

