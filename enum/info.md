# More info

For more about these capabilities, see ``Properties, Methods, Initialization, Extensions, and Protocols``.

## Note

Swift enumeration cases don’t have an integer value set by default, unlike languages like C and Objective-C. In the CompassPoint example above, north, south, east and west don’t implicitly equal 0, 1, 2 and 3. Instead, the different enumeration cases are values in their own right, with an explicitly defined type of CompassPoint.

Each enumeration definition defines a new type. Like other types in Swift, their names (such as CompassPoint and Planet) start with a capital letter. Give enumeration types singular rather than plural names, so that they read as self-evident:

---

## Mercury

- Mercury is the smallest planet in the solar system, and it is also the planet closest to the Sun

## Venus

- Venus is the second planet from the Sun. It is a terrestrial planet and is the closest in mass and size to its orbital neighbour Earth.

## Earth

## Earth is the third planet from the Sun and the only astronomical object known to harbor life

## Mars

- Mars is the fourth planet from the Sun, and the seventh largest. It's the only planet we know of inhabited entirely by robots.

## Jupiter

- Jupiter is the fifth planet from the Sun and the largest in the Solar System. A gas giant, Jupiter's mass is more than two and a half times that of all the other planets in the Solar System combined and slightly less than one one-thousandth the mass of the Sun

## Saturn

- Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter

## Uranus

- Uranus is the seventh planet from the Sun. It is a gaseous cyan-coloured ice giant. Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which in astronomy is called 'ice' or volatiles

## Neptune

- Neptune is the eighth and farthest known planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than fellow ice giant Uranus

## BarCode

- An inventory tracking system to store UPC barcodes as a tuple of four integers,
- and QR code barcodes as a string of any length.
- An enumeration to define product barcodes of either type:
- “Define an enumeration type called Barcode, which can take
- either a value of upc with an associated value of type (Int, Int, Int, Int),
- or a value of qrCode with an associated value of type String.”
- This definition doesn’t provide any actual Int or String values
- it just defines the type of associated values that Barcode constants
- and variables can store when they’re equal to Barcode.upc or Barcode.qrCode.

 The original Barcode.upc and its integer values are replaced by the new Barcode.qrCode and its string value. Constants and variables of type Barcode can store either a .upc or a .qrCode (together with their associated values), but they can store only one of them at any given time

```Note

Raw values are not the same as associated values. Raw values are set to prepopulated values when you first define the enumeration in your code, like the three ASCII codes above. The raw value for a particular enumeration case is always the same. Associated values are set when you create a new constant or variable based on one of the enumeration’s cases, and can be different each time you do so.


```swift
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
/// Matching individual enumeration values with a Switch Statement:
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// Prints "Mostly harmless"

```

## Failable Initializers

A failable initializer is a type of initializer that produces an optional instance or an implicitly unwrapped optional instance of the type the initializer is declared on. As a result, a failable initializer can return nil to indicate that initialization failed.

To declare a failable initializer that produces an optional instance, append a question mark to the init keyword in the initializer declaration (init?). To declare a failable initializer that produces an implicitly unwrapped optional instance, append an exclamation point instead (init!). The example below shows an init? failable initializer that produces an optional instance of a structure

```swift
struct SomeStruct {
    let property: String
    // produces an optional instance of 'SomeStruct'
    init?(input: String) {
        if input.isEmpty {
            // discard 'self' and return 'nil'
            return nil
        }
        property = input
    }
}

You call an init? failable initializer in the same way that you call a nonfailable initializer, except that you must deal with the optionality of the result.

if let actualInstance = SomeStruct(input: "Hello") {
    // do something with the instance of 'SomeStruct'
} else {
    // initialization of 'SomeStruct' failed and the initializer returned 'nil'
}

A failable initializer can return nil at any point in the implementation of the initializer’s body.

A failable initializer can delegate to any kind of initializer. A nonfailable initializer can delegate to another nonfailable initializer or to an init! failable initializer. A nonfailable initializer can delegate to an init? failable initializer by force-unwrapping the result of the superclass’s initializer — for example, by writing super.init()!.

Initialization failure propagates through initializer delegation. Specifically, if a failable initializer delegates to an initializer that fails and returns nil, then the initializer that delegated also fails and implicitly returns nil. If a nonfailable initializer delegates to an init! failable initializer that fails and returns nil, then a runtime error is raised (as if you used the ! operator to unwrap an optional that has a nil value).

A failable designated initializer can be overridden in a subclass by any kind of designated initializer. A nonfailable designated initializer can be overridden in a subclass by a nonfailable designated initializer only.

For more information and to see examples of failable initializers, see Failable Initializers.

Grammar of an initializer declaration

initializer-declaration → initializer-head generic-parameter-clause? parameter-clause async? throws? generic-where-clause? initializer-body
initializer-declaration → initializer-head generic-parameter-clause? parameter-clause async? rethrows generic-where-clause? initializer-body
initializer-head → attributes? declaration-modifiers? init
initializer-head → attributes? declaration-modifiers? init ?
initializer-head → attributes? declaration-modifiers? init !
initializer-body → code-block


 Recursive Enumerations
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
```
