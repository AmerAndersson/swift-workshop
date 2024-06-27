# Structures and classes

Structures and classes are general-purpose, flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your structures and classes using the same syntax you use to define constants, variables, and functions.

Unlike other programming languages, Swift doesn’t require you to create separate interface and implementation files for custom structures and classes. In Swift, you define a structure or class in a single file, and the external interface to that class or structure is automatically made available for other code to use.

## Note

An instance of a class is traditionally known as an object. However, Swift structures and classes are much closer in functionality than in other languages, and much of this chapter describes functionality that applies to instances of either a class or a structure type. Because of this, the more general term instance is used.

## Comparing Structures and Classes

Structures and classes in Swift have many things in common. Both can:

Define properties to store values

Define methods to provide functionality

Define subscripts to provide access to their values using subscript syntax

Define initializers to set up their initial state

Be extended to expand their functionality beyond a default implementation

Conform to protocols to provide standard functionality of a certain kind

For more information, see Properties, Methods, Subscripts, Initialization, Extensions, and Protocols.

Classes have additional capabilities that structures don’t have:

Inheritance enables one class to inherit the characteristics of another.

Type casting enables you to check and interpret the type of a class instance at runtime.

Deinitializers enable an instance of a class to free up any resources it has assigned.

Reference counting allows more than one reference to a class instance.

For more information, see Inheritance, Type Casting, Deinitialization, and Automatic Reference Counting.

## Choosing Between Structures and Classes

Decide how to store data and model behavior.
Structures and classes are good choices for storing data and modeling behavior in your apps, but their similarities can make it difficult to choose one over the other.

Consider the following recommendations to help choose which option makes sense when adding a new data type to your app.

Use structures by default.

Use classes when you need Objective-C interoperability.

Use classes when you need to control the identity of the data you’re modeling.

Use structures along with protocols to adopt behavior by sharing implementations.

## Choose Structures by Default

Use structures to represent common kinds of data. Structures in Swift include many features that are limited to classes in other languages: They can include stored properties, computed properties, and methods. Moreover, Swift structures can adopt protocols to gain behavior through default implementations. The Swift standard library and Foundation use structures for types you use frequently, such as numbers, strings, arrays, and dictionaries.

Using structures makes it easier to reason about a portion of your code without needing to consider the whole state of your app. Because structures are value types—unlike classes—local changes to a structure aren’t visible to the rest of your app unless you intentionally communicate those changes as part of the flow of your app. As a result, you can look at a section of code and be more confident that changes to instances in that section will be made explicitly, rather than being made invisibly from a tangentially related function call.

Use Classes When You Need Objective-C Interoperability
If you use an Objective-C API that needs to process your data, or you need to fit your data model into an existing class hierarchy defined in an Objective-C framework, you might need to use classes and class inheritance to model your data. For example, many Objective-C frameworks expose classes that you are expected to subclass.

Use Classes When You Need to Control Identity
Classes in Swift come with a built-in notion of identity because they’re reference types. This means that when two different class instances have the same value for each of their stored properties, they’re still considered to be different by the identity operator (===). It also means that when you share a class instance across your app, changes you make to that instance are visible to every part of your code that holds a reference to that instance. Use classes when you need your instances to have this kind of identity. Common use cases are file handles, network connections, and shared hardware intermediaries like CBCentralManager.

if you have a type that represents a local database connection, the code that manages access to that database needs full control over the state of the database as viewed from your app. It’s appropriate to use a class in this case, but be sure to limit which parts of your app get access to the shared database object.

## Important

Treat identity with care. Sharing class instances pervasively throughout an app makes logic errors more likely. You might not anticipate the consequences of changing a heavily shared instance, so it’s more work to write such code correctly.

Local changes to model types like PenPalRecord are useful. For example, an app might recommend multiple different penpals in response to user feedback. Because the PenPalRecord structure doesn’t control the identity of the underlying database records, there’s no risk that the changes made to local PenPalRecord instances accidentally change values in the database.

If another part of the app changes myNickname and submits a change request back to the server, the most recently rejected penpal recommendation won’t be mistakenly picked up by the change. Because the myID property is declared as a constant, it can’t change locally. As a result, requests to the database won’t accidentally change the wrong record.

Use Structures and Protocols to Model Inheritance and Share Behavior
Structures and classes both support a form of inheritance. Structures and protocols can only adopt protocols; they can’t inherit from classes. However, the kinds of inheritance hierarchies you can build with class inheritance can be also modeled using protocol inheritance and structures.

If you’re building an inheritance relationship from scratch, prefer protocol inheritance. Protocols permit classes, structures, and enumerations to participate in inheritance, while class inheritance is only compatible with other classes. When you’re choosing how to model your data, try building the hierarchy of data types using protocol inheritance first, then adopt those protocols in your structures.

```swift
// Local changes to model types like PenPalRecord are useful. 
// An app might recommend multiple different penpals in response to user feedback. 
// Because the PenPalRecord structure doesn’t control the identity of the underlying database records, 
// there’s no risk that the changes made to local PenPalRecord instances accidentally change values in the database.

// If another part of the app changes myNickname and submits a change request back to the server,
// the most recently rejected penpal recommendation won’t be mistakenly picked up by the change. 
// Because the myID property is declared as a constant, it can’t change locally. 
// As a result, requests to the database won’t accidentally change the wrong record.

struct PenPalRecord {
    let id: Int
    var nickname: String
    var recommendedPenPalID: Int
}
var myRecord = try JSONDecoder().decode(PenPalRecord.self, from: jsonResponse)
```

The example above defines a new structure called Resolution, to describe a pixel-based display resolution. This structure has two stored properties called width and height. Stored properties are constants or variables that are bundled up and stored as part of the structure or class. These two properties are inferred to be of type Int by setting them to an initial integer value of 0.

The example above also defines a new class called VideoMode, to describe a specific video mode for video display. This class has four variable stored properties. The first, resolution, is initialized with a new Resolution structure instance, which infers a property type of Resolution. For the other three properties, new VideoMode instances will be initialized with an interlaced setting of false (meaning “noninterlaced video”), a playback frame rate of 0.0, and an optional String value called name. The name property is automatically given a default value of nil, or “no name value”, because it’s of an optional type.

## Structure and Class Instances

The Resolution structure definition and the VideoMode class definition only describe what a Resolution or VideoMode will look like. They themselves don’t describe a specific resolution or video mode. To do that, you need to create an instance of the structure or class.

Structures and classes both use initializer syntax for new instances. The simplest form of initializer syntax uses the type name of the class or structure followed by empty parentheses, such as Resolution() or VideoMode(). This creates a new instance of the class or structure, with any properties initialized to their default values. Class and structure initialization is described in more detail in Initialization.

## Accessing Properties

You can access the properties of an instance using dot syntax. In dot syntax, you write the property name immediately after the instance name, separated by a period (.), without any spaces:
In this example, someResolution.width refers to the width property of someResolution, and returns its default initial value of 0.

You can drill down into subproperties, such as the width property in the resolution property of a VideoMode

## Memberwise Initializers for Structure

All structures have an automatically generated memberwise initializer, which you can use to initialize the member properties of new structure instances. Initial values for the properties of the new instance can be passed to the memberwise initializer by name:

## Structures and Enumerations Are Value Types

A value type is a type whose value is copied when it’s assigned to a variable or constant, or when it’s passed to a function.

You’ve actually been using value types extensively throughout the previous chapters. In fact, all of the basic types in Swift — integers, floating-point numbers, Booleans, strings, arrays and dictionaries — are value types, and are implemented as structures behind the scenes.

All structures and enumerations are value types in Swift. This means that any structure and enumeration instances you create — and any value types they have as properties — are always copied when they’re passed around in your code.

## Notes

Collections defined by the Swift standard library like arrays, dictionaries, and strings use an optimization to reduce the performance cost of copying. Instead of making a copy immediately, these collections share the memory where the elements are stored between the original instance and any copies. If one of the copies of the collection is modified, the elements are copied just before the modification. The behavior you see in your code is always as if a copy took place immediately.

This example declares a constant called hd and sets it to a Resolution instance initialized with the width and height of full HD video (1920 pixels wide by 1080 pixels high).

It then declares a variable called cinema and sets it to the current value of hd. Because Resolution is a structure, a copy of the existing instance is made, and this new copy is assigned to cinema. Even though hd and cinema now have the same width and height, they’re two completely different instances behind the scenes.

Next, the width property of cinema is amended to be the width of the slightly wider 2K standard used for digital cinema projection (2048 pixels wide and 1080 pixels high):

When cinema was given the current value of hd, the values stored in hd were copied into the new cinema instance. The end result was two completely separate instances that contained the same numeric values. However, because they’re separate instances, setting the width of cinema to 2048 doesn’t affect the width stored in hd, as shown in the figure below:

## The same behavior applies to enumerations

When rememberedDirection is assigned the value of currentDirection, it’s actually set to a copy of that value. Changing the value of currentDirection thereafter doesn’t affect the copy of the original value that was stored in rememberedDirection

## Classes Are Reference Types

Unlike value types, reference types are not copied when they’re assigned to a variable or constant, or when they’re passed to a function. Rather than a copy, a reference to the same existing instance is used.

This example declares a new constant called tenEighty and sets it to refer to a new instance of the VideoMode class. The video mode is assigned a copy of the HD resolution of 1920 by 1080 from before. It’s set to be interlaced, its name is set to "1080i", and its frame rate is set to 25.0 frames per second.

Because classes are reference types, tenEighty and alsoTenEighty actually both refer to the same VideoMode instance. Effectively, they’re just two different names for the same single instance, as shown in the figure below:

Checking the frameRate property of tenEighty shows that it correctly reports the new frame rate of 30.0 from the underlying VideoMode instance:

This example also shows how reference types can be harder to reason about. If tenEighty and alsoTenEighty were far apart in your program’s code, it could be difficult to find all the ways that the video mode is changed. Wherever you use tenEighty, you also have to think about the code that uses alsoTenEighty, and vice versa. In contrast, value types are easier to reason about because all of the code that interacts with the same value is close together in your source files.

Note that tenEighty and alsoTenEighty are declared as constants, rather than variables. However, you can still change tenEighty.frameRate and alsoTenEighty.frameRate because the values of the tenEighty and alsoTenEighty constants themselves don’t actually change. tenEighty and alsoTenEighty themselves don’t “store” the VideoMode instance — instead, they both refer to a VideoMode instance behind the scenes. It’s the frameRate property of the underlying VideoMode that’s changed, not the values of the constant references to that VideoMode.

## Identity Operators

Because classes are reference types, it’s possible for multiple constants and variables to refer to the same single instance of a class behind the scenes. (The same isn’t true for structures and enumerations, because they’re always copied when they’re assigned to a constant or variable, or passed to a function.)

It can sometimes be useful to find out whether two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators:

Identical to (===)

Not identical to (!==)

Use these operators to check whether two constants or variables refer to the same single instance:

Note that identical to (represented by three equal signs, or ===) doesn’t mean the same thing as equal to (represented by two equal signs, or ==). Identical to means that two constants or variables of class type refer to exactly the same class instance. Equal to means that two instances are considered equal or equivalent in value, for some appropriate meaning of equal, as defined by the type’s designer.

When you define your own custom structures and classes, it’s your responsibility to decide what qualifies as two instances being equal. The process of defining your own implementations of the == and != operators is described in Equivalence Operators.

## Pointers page

If you have experience with C, C++, or Objective-C, you may know that these languages use pointers to refer to addresses in memory. A Swift constant or variable that refers to an instance of some reference type is similar to a pointer in C, but isn’t a direct pointer to an address in memory, and doesn’t require you to write an asterisk (*) to indicate that you are creating a reference. Instead, these references are defined like any other constant or variable in Swift. The Swift standard library provides pointer and buffer types that you can use if you need to interact with pointers directly — see Manual Memory Management.
