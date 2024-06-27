
/**
The following defines a base class called Vehicle. 
This base class declares a stored property called numberOfWheels, with a default Int value of 0.
The numberOfWheels property is used by a computed property called description to create a String description of the vehicle’s characteristics:

The Vehicle class provides a default value for its only stored property, 
and doesn’t provide any custom initializers itself. As a result, it automatically receives a default initializer, 
The default initializer (when available) is always a designated initializer for a class, and can be used to create a new Vehicle instance with a numberOfWheels of 0:
*/

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
// Vehicle: 0 wheel(s)

/*
Define a subclass of Vehicle called Bicycle:
The Bicycle subclass defines a custom designated initializer, init(). This designated initializer matches a designated initializer from the superclass of Bicycle, and so the Bicycle version of this initializer is marked with the override modifier.

The init() initializer for Bicycle starts by calling super.init(), which calls the default initializer for the Bicycle class’s superclass, Vehicle. This ensures that the numberOfWheels inherited property is initialized by Vehicle before Bicycle has the opportunity to modify the property. After calling super.init(), the original value of numberOfWheels is replaced with a new value of 2.
*/
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
// If you create an instance of Bicycle, 
// you can call its inherited description computed property
// to see how its numberOfWheels property has been updated:

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
// Bicycle: 2 wheel(s)

/**
 Define another subclass of Vehicle, called Hoverboard. In its initializer, 
 the Hoverboard class sets only its color property. Instead of making an explicit call to super.init(), 
 this initializer relies on an implicit call to its superclass’s initializer to complete the process.
 */
 class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}
// An instance of Hoverboard uses the default number 
// of wheels supplied by the Vehicle initializer.

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")
// Hoverboard: 0 wheel(s) in a beautiful silver
print("-----------------------------------")

/**
 Automatic Initializer Inheritance
Designated and Convenience Initializers in Action

The following example shows designated initializers, convenience initializers, and automatic initializer inheritance in action. This example defines a hierarchy of three classes called Food, RecipeIngredient, and ShoppingListItem, and demonstrates how their initializers interact.

The base class in the hierarchy is called Food, which is a simple class to encapsulate the name of a foodstuff. The Food class introduces a single String property called name and provides two initializers for creating Food instances:
*/
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

/**
Classes don’t have a default memberwise initializer,
and so the Food class provides a designated initializer that takes a single argument called name.
This initializer can be used to create a new Food instance with a specific name:

The init(name: String) initializer from the Food class is provided as a designated initializer, because it ensures that all stored properties of a new Food instance are fully initialized. The Food class doesn’t have a superclass, and so the init(name: String) initializer doesn’t need to call super.init() to complete its initialization.

The Food class also provides a convenience initializer, init(), with no arguments. The init() initializer provides a default placeholder name for a new food by delegating across to the Food class’s init(name: String) with a name value of [Unnamed]:
*/

let namedMeat = Food(name: "Bacon")
// namedMeat's name is "Bacon"
print("NamedMeat: \(namedMeat.name)")
let mysteryMeat = Food()
print("NamedMeat: \(mysteryMeat.name)")
// mysteryMeat's name is "[Unnamed]"

/**
The second class in the hierarchy is a subclass of Food called RecipeIngredient.
The RecipeIngredient class models an ingredient in a cooking recipe.
It introduces an Int property called quantity (in addition to the name property it inherits from Food)
and defines two initializers for creating RecipeIngredient instances:
*/
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
// All three of these initializers can be used to create new RecipeIngredient instances:
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
// print out all these 
print("OneMysteryItem: \(oneMysteryItem.name), \(oneMysteryItem.quantity)")
print("OneBacon: \(oneBacon.name), \(oneBacon.quantity)")
print("SixEggs: \(sixEggs.name), \(sixEggs.quantity)")
print("-----------------------------------")

/**
The third and final class in the hierarchy is a subclass of RecipeIngredient called ShoppingListItem. 
The ShoppingListItem class models a recipe ingredient as it appears in a shopping list.

Every item in the shopping list starts out as “unpurchased”. 
To represent this fact, ShoppingListItem introduces a Boolean property called purchased,
with a default value of false. ShoppingListItem also adds a computed description property, 
which provides a textual description of a ShoppingListItem instance:

ShoppingListItem automatically inherits all of the designated and convenience initializers from its superclass.
*/
class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}
/**
You can use all three of the inherited initializers to create a new ShoppingListItem instance:
Here, a new array called breakfastList is created from an array literal containing three new ShoppingListItem instances. The type of the array is inferred to be [ShoppingListItem]. After the array is created, the name of the ShoppingListItem at the start of the array is changed from "[Unnamed]" to "Orange juice" and it’s marked as having been purchased. Printing the description of each item in the array shows that their default states have been set as expected.
*/
var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
breakfastList[1].name = "Bacon"
breakfastList[1].purchased = true
breakfastList[2].name = "Eggs"
breakfastList[2].purchased = true
for item in breakfastList {
    print(item.description)
}
// 1 x Orange juice ✔
// 1 x Bacon ✘
// 6 x Eggs ✘
print("-----------------------------------")

