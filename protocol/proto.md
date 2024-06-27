# Greet

```s
- Greet is the name of the protocol.
- name is a gettable property defined in the protocol.
- message() is a method definition without any implementation.
It’s important to note that the protocol only holds the method or property definitions, not their actual body. Additionally, the protocol must specify whether a property will be gettable or both gettable and settable.

To use a protocol, other classes must conform to it. After conforming a class to the protocol, we must provide an actual implementation of the methods. Here’s how you can conform a class to the Greet protocol:

- The Employee class conforms to this protocol and provides the actual implementation of the name property and the message() method

- Property requirements
* The protocol doesn’t specify whether the property should be a stored property 
* or a computed property — it only specifies the required property name and type. 
* The protocol also specifies whether each property must be gettable or gettable and settable.

If a protocol requires a property to be gettable and settable, that property requirement can’t be fulfilled by a constant stored property or a read-only computed property. If the protocol only requires a property to be gettable, the requirement can be satisfied by any kind of property, and it’s valid for the property to be also settable if this is useful for your own code.

Property requirements are always declared as variable properties, prefixed with the var keyword. Gettable and settable properties are indicated by writing { get set } after their type declaration, and gettable properties are indicated by writing { get }.

Always prefix type property requirements with the static keyword when you define them in a protocol. This rule pertains even though type property requirements can be prefixed with the class or static keyword when implemented by a class:

** Note

You don’t need to mark protocol initializer implementations with the required modifier on classes that are marked with the final modifier, because final classes can’t subclassed. For more about the final modifier, see 

** Preventing Overrides.
You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript).

Any attempt to override a final method, property, or subscript in a subclass is reported as a compile-time error. Methods, properties, or subscripts that you add to a class in an extension can also be marked as final within the extension’s definition. For more information, see Extensions.

You can mark an entire class as final by writing the final modifier before the class keyword in its class definition (final class). Any attempt to subclass a final class is reported as a compile-time error.

** Extensions
Add functionality to an existing type.
Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you don’t have access to the original source code (known as retroactive modeling). Swift extensions don’t have names.

* * Extensions in Swift can:

- Add computed instance properties and computed type properties

- Define instance methods and type methods

- Provide new initializers

- Define subscripts

- Define and use new nested types

- Make an existing type conform to a protocol

In Swift, you can even extend a protocol to provide implementations of its requirements or add additional functionality that conforming types can take advantage of.

- starship
more complex class, which also adopts and conforms to the FullyNamed protocol:
This class implements the fullName property requirement as a computed read-only property for a starship. Each Starship class instance stores a mandatory name and an optional prefix. The fullName property uses the prefix value if it exists, and prepends it to the beginning of name to create a full name for the starship

- RandomNumberGenerator
This protocol, RandomNumberGenerator, requires any conforming type to have an instance method called random, which returns a Double value whenever it’s called. Although it’s not specified as part of the protocol, it’s assumed that this value will be a number from 0.0 up to (but not including) 1.0.

The RandomNumberGenerator protocol doesn’t make any assumptions about how each random number will be generated — it simply requires the generator to provide a standard way to generate a new random number.

Here’s an implementation of a class that adopts and conforms to the RandomNumberGenerator protocol. This class implements a pseudorandom number generator algorithm known as a linear congruential generator:
```

```s Mutating Method Requirements
It’s sometimes necessary for a method to modify (or mutate) the instance it belongs to. For instance methods on value types (that is, structures and enumerations) you place the mutating keyword before a method’s func keyword to indicate that the method is allowed to modify the instance it belongs to and any properties of that instance. This process is described in Modifying Value Types from Within Instance Methods.

If you define a protocol instance method requirement that’s intended to mutate instances of any type that adopts the protocol, mark the method with the mutating keyword as part of the protocol’s definition. This enables structures and enumerations to adopt the protocol and satisfy that method requirement.

* * Note
If you mark a protocol instance method requirement as mutating, you don’t need to write the mutating keyword when writing an implementation of that method for a class. The mutating keyword is only used by structures and enumerations.

Below defines a protocol called Togglable, which defines a single instance method requirement called toggle. As its name suggests, the toggle() method is intended to toggle or invert the state of any conforming type, typically by modifying a property of that type.

The toggle() method is marked with the mutating keyword as part of the Togglable protocol definition, to indicate that the method is expected to mutate the state of a conforming instance when it’s called

If you implement the Togglable protocol for a structure or enumeration, that structure or enumeration can conform to the protocol by providing an implementation of the toggle() method that’s also marked as mutating.

Below defines an enumeration called OnOffSwitch. This enumeration toggles between two states, indicated by the enumeration cases on and off. The enumeration’s toggle implementation is marked as mutating, to match the Togglable protocol’s requirements:
```

```swift

Protocol Syntax
You define protocols in a very similar way to classes, structures, and enumerations:

protocol SomeProtocol {
    // protocol definition goes here
}
Custom types state that they adopt a particular protocol by placing the protocol’s name after the type’s name, separated by a colon, as part of their definition. Multiple protocols can be listed, and are separated by commas:

struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}
If a class has a superclass, list the superclass name before any protocols it adopts, followed by a comma:

class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // class definition goes here
}
```

## Note

Because protocols are types, begin their names with a capital letter (such as FullyNamed and RandomNumberGenerator) to match the names of other types in Swift (such as Int, String, and Double).

¤## Property Requirements

A protocol can require any conforming type to provide an instance property or type property with a particular name and type. The protocol doesn’t specify whether the property should be a stored property or a computed property — it only specifies the required property name and type. The protocol also specifies whether each property must be gettable or gettable and settable.

If a protocol requires a property to be gettable and settable, that property requirement can’t be fulfilled by a constant stored property or a read-only computed property. If the protocol only requires a property to be gettable, the requirement can be satisfied by any kind of property, and it’s valid for the property to be also settable if this is useful for your own code.

## Alternative Keywords

```swift

You might wonder about the difference between static and class.
Both can be used for type properties, but there’s a subtle distinction:
static is used for type properties in structs, enums, and final classes.
class is used for type properties in non-final classes (i.e., classes that can be subclassed).
Since protocols can’t enforce whether a conforming type is a final class or not, it’s safer to use static to ensure consistency across all conforming types.


## Method Requirements

Protocols can require specific instance methods and type methods to be implemented by conforming types. These methods are written as part of the protocol’s definition in exactly the same way as for normal instance and type methods, but without curly braces or a method body. Variadic parameters are allowed, subject to the same rules as for normal methods. Default values, however, can’t be specified for method parameters within a protocol’s definition.

As with type property requirements, you always prefix type method requirements with the static keyword when they’re defined in a protocol. This is true even though type method requirements are prefixed with the class or static keyword when implemented by a class:

protocol SomeProtocol {
    static func someTypeMethod()
}


 For values x and y and their truncated integer quotient q, the remainder r satisfies x == y * q + r.
let x = 8.625
print(x / 0.75)
// Prints "11.5"


let q = (x / 0.75).rounded(.towardZero)
// q == 11.0
let r = x.truncatingRemainder(dividingBy: 0.75)
// r == 0.375


let x1 = 0.75 * q + r
// x1 == 8.625

## Mutating Method Requirements

It’s sometimes necessary for a method to modify (or mutate) the instance it belongs to. For instance methods on value types (that is, structures and enumerations) you place the mutating keyword before a method’s func keyword to indicate that the method is allowed to modify the instance it belongs to and any properties of that instance. This process is described in Modifying Value Types from Within Instance Methods.

If you define a protocol instance method requirement that’s intended to mutate instances of any type that adopts the protocol, mark the method with the mutating keyword as part of the protocol’s definition. This enables structures and enumerations to adopt the protocol and satisfy that method requirement.

Note

If you mark a protocol instance method requirement as mutating, you don’t need to write the mutating keyword when writing an implementation of that method for a class. The mutating keyword is only used by structures and enumerations.

## Preventing Overrides

You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript).

Any attempt to override a final method, property, or subscript in a subclass is reported as a compile-time error. Methods, properties, or subscripts that you add to a class in an extension can also be marked as final within the extension’s definition. For more information, see Extensions.

You can mark an entire class as final by writing the final modifier before the class keyword in its class definition (final class). Any attempt to subclass a final class is reported as a compile-time error.

Failable Initializer Requirements
Protocols can define failable initializer requirements for conforming types, as defined in Failable Initializers

## Protocols as Types

Protocols don’t actually implement any functionality themselves. Regardless, you can use a protocol as a type in your code.

The most common way to use a protocol as a type is to use a protocol as a generic constraint. Code with generic constraints can work with any type that conforms to the protocol, and the specific type is chosen by the code that uses the API. For example, when you call a function that takes an argument and that argument’s type is generic, the caller chooses the type.

Code with an opaque type works with some type that conforms to the protocol. The underlying type is known at compile time, and the API implementation chooses that type, but that type’s identity is hidden from clients of the API. Using an opaque type lets you prevent implementation details of an API from leaking through the layer of abstraction — for example, by hiding the specific return type from a function, and only guaranteeing that the value conforms to a given protocol.

Code with a boxed protocol type works with any type, chosen at runtime, that conforms to the protocol. To support this runtime flexibility, Swift adds a level of indirection when necessary — known as a box, which has a performance cost. Because of this flexibility, Swift doesn’t know the underlying type at compile time, which means you can access only the members that are required by the protocol. Accessing any other APIs on the underlying type requires casting at runtime.

For information about using protocols as generic constraints, see Generics. For information about opaque types, and boxed protocol types, see Opaque and Boxed Types.

In Swift, weak references are used to prevent strong reference cycles (retain cycles) between objects.
A weak reference doesn’t keep the referenced object alive; it becomes nil when the object is deallocated.
