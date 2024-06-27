/**
** Concurrency & Perform asynchronous operations
** Uses the term concurrency to refer to this common combination of asynchronous and parallel code.
Swift has built-in support for writing asynchronous and parallel code in a structured way. Asynchronous code can be suspended and resumed later, although only one piece of the program executes at a time. Suspending and resuming code in your program lets it continue to make progress on short-term operations like updating its UI while continuing to work on long-running operations like fetching data over the network or parsing files. Parallel code means multiple pieces of code run simultaneously — for example, a computer with a four-core processor can run four pieces of code at the same time, with each core carrying out one of the tasks. A program that uses parallel and asynchronous code carries out multiple operations at a time, and it suspends operations that are waiting for an external system.

The additional scheduling flexibility from parallel or asynchronous code also comes with a cost of increased complexity. Swift lets you express your intent in a way that enables some compile-time checking — for example, you can use actors to safely access mutable state. However, adding concurrency to slow or buggy code isn’t a guarantee that it will become fast or correct. In fact, adding concurrency might even make your code harder to debug. However, using Swift’s language-level support for concurrency in code that needs to be concurrent means Swift can help you catch problems at compile time.

To indicate that a function or method is asynchronous, you write the async keyword in its declaration after its parameters, similar to how you use throws to mark a throwing function. If the function or method returns a value, you write async before the return arrow (->).

For a function or method that’s both asynchronous and throwing, you write async before throws.

When calling an asynchronous method, execution suspends until that method returns. You write await in front of the call to mark the possible suspension point. This is like writing try when calling a throwing function, to mark the possible change to the program’s flow if there’s an error. Inside an asynchronous method, the flow of execution is suspended only when you call another asynchronous method — suspension is never implicit or preemptive — which means every possible suspension point is marked with await. Marking all of the possible suspension points in your code helps make concurrent code easier to read and understand.
*/


/**
Although it’s possible to write concurrent code without using Swift’s language support, 
that code tends to be harder to read. The following code downloads a list of photo names,
downloads the first photo in that list, and shows that photo to the user:
Even in this simple case, because the code has to be written as a series of completion handlers, 
**you end up writing nested closures. In this style, more complex code with deep nesting can quickly become unwieldy.
*/
listPhotos(inGallery: "Summer Vacation") { photoNames in
    let sortedNames = photoNames.sorted()
    let name = sortedNames[0]
    downloadPhoto(named: name) { photo in
        show(photo)
    }
}

/**
 ** Defining and Calling Asynchronous Functions
 An asynchronous function or asynchronous method is a special kind of function or method that can be suspended while it’s partway through execution. This is in contrast to ordinary, synchronous functions and methods, which either run to completion, throw an error, or never return. An asynchronous function or method still does one of those three things, but it can also pause in the middle when it’s waiting for something. Inside the body of an asynchronous function or method, you mark each of these places where execution can be suspended.

 To indicate that a function or method is asynchronous, you write the async keyword in its declaration after its parameters, similar to how you use throws to mark a throwing function. If the function or method returns a value, you write async before the return arrow (->). For a function or method that’s both asynchronous and throwing, you write async before throws.

 When calling an asynchronous method, execution suspends until that method returns. You write await in front of the call to mark the possible suspension point. This is like writing try when calling a throwing function, to mark the possible change to the program’s flow if there’s an error. Inside an asynchronous method, the flow of execution is suspended only when you call another asynchronous method — suspension is never implicit or preemptive — which means every possible suspension point is marked with await. Marking all of the possible suspension points in your code helps make concurrent code easier to read and understand.
*/

// Here’s how you might fetch the names of photos in a gallery:
func listPhotos(inGallery name: String) async -> [String] {
    // let result = ... some asynchronous networking code ...
    return result
}

/**
The code below fetches the names of all the pictures in a gallery and then shows the first picture:
Because the listPhotos(inGallery:) and downloadPhoto(named:) functions both need to make network requests,
they could take a relatively long time to complete. Making them both asynchronous by writing async before 
the return arrow lets the rest of the app’s code keep running while this code waits for the picture to be ready.
*/
let photoNames = await listPhotos(inGallery: "Summer Vacation")
let sortedNames = photoNames.sorted()
let name = sortedNames[0]
let photo = await downloadPhoto(named: name)
show(photo)

/**
You can explicitly insert a suspension point by calling the Task.yield() method.
Assuming the code that renders video is synchronous, it doesn’t contain any suspension points. The work to render video could also take a long time. However, you can periodically call Task.yield() to explicitly add suspension points. Structuring long-running code this way lets Swift balance between making progress on this task, and letting other tasks in your program make progress on their work.
*/
func generateSlideshow(forGallery gallery: String) async {
    let photos = await listPhotos(inGallery: gallery)
    for photo in photos {
        // ... render a few seconds of video for this photo ...
        await Task.yield()
    }
}

/**
The Task.sleep(for:tolerance:clock:) method is useful when writing simple code to learn how concurrency works. This method suspends the current task for at least the given amount of time. Here’s a version of the listPhotos(inGallery:) function that uses sleep(for:tolerance:clock:) to simulate waiting for a network operation:

The version of listPhotos(inGallery:) in the code above is both asynchronous and throwing, because the call to Task.sleep(until:tolerance:clock:) can throw an error. When you call this version of listPhotos(inGallery:), you write both try and await:
*/
func listPhotos(inGallery name: String) async throws -> [String] {
    try await Task.sleep(for: .seconds(2))
    return ["IMG001", "IMG99", "IMG0404"]
}

// Asynchronous functions have some similarities to throwing functions:
// When you define an asynchronous or throwing function,
// you mark it with async or throws, and you mark calls to that function with await or try. 
// An asynchronous function can call another asynchronous function, 
// just like a throwing function can call another throwing function.
let photos = try await listPhotos(inGallery: "A Rainy Weekend")

/**
** Asynchronous Sequences
The listPhotos(inGallery:) function in the previous section asynchronously
returns the whole array at once, after all of the array’s elements are ready. 
Another approach is to wait for one element of the collection at a time using an asynchronous sequence.
Here’s what iterating over an asynchronous sequence looks like:
*/

import Foundation

let handle = FileHandle.standardInput
for try await line in handle.bytes.lines {
    print(line)
}

/**
** Calling Asynchronous Functions in Parallel
Calling an asynchronous function with await runs only one piece of code at a time.
While the asynchronous code is running, the caller waits for that code to finish before moving on to run the next line of code.
To fetch the first three photos from a gallery, you could await three calls to the downloadPhoto(named:) function as follows:

This approach has an important drawback: Although the download is asynchronous and lets other work happen while it progresses, only one call to downloadPhoto(named:) runs at a time. Each photo downloads completely before the next one starts downloading. However, there’s no need for these operations to wait — each photo can download independently, or even at the same time.
*/
let firstPhoto = await downloadPhoto(named: photoNames[0])
let secondPhoto = await downloadPhoto(named: photoNames[1])
let thirdPhoto = await downloadPhoto(named: photoNames[2])

let photos = [firstPhoto, secondPhoto, thirdPhoto]
show(photos)

/**
** To call an asynchronous function and let it run in parallel with code around it,
write async in front of let when you define a constant, and then write await each time you use the constant.

All three calls to downloadPhoto(named:) start without waiting for the previous one to complete. If there are enough system resources available, they can run at the same time. None of these function calls are marked with await because the code doesn’t suspend to wait for the function’s result. Instead, execution continues until the line where photos is defined — at that point, the program needs the results from these asynchronous calls, so you write await to pause execution until all three photos finish downloading.

** Here’s how you can think about the differences between these two approaches:

- Call asynchronous functions with await when the code on the following lines depends on that function’s result. This creates work that is carried out sequentially.

- Call asynchronous functions with async-let when you don’t need the result until later in your code. This creates work that can be carried out in parallel.

- Both await and async-let allow other code to run while they’re suspended.

- In both cases, you mark the possible suspension point with await to indicate that execution will pause, if needed, until an asynchronous function has returned.

**  You can also mix both of these approaches in the same code.
*/
async let firstPhoto = downloadPhoto(named: photoNames[0])
async let secondPhoto = downloadPhoto(named: photoNames[1])
async let thirdPhoto = downloadPhoto(named: photoNames[2])

let photos = await [firstPhoto, secondPhoto, thirdPhoto]
show(photos)

/**
** Tasks and Task Groups
A task is a unit of work that can be run asynchronously as part of your program.
All asynchronous code runs as part of some task. A task itself does only one thing at a time, 
but when you create multiple tasks, Swift can schedule them to run simultaneously.

** Another version of the code to download photos that handles any number of photos:
The code creates a new task group, and then creates child tasks to download each photo in the gallery.
Swift runs as many of these tasks concurrently as conditions allow. As soon a child task finishes downloading a photo, 
that photo is displayed. There’s no guarantee about the order that child tasks complete, so the photos from this gallery
can be shown in any order. In the code listing, each photo is downloaded and then displayed, so the task group doesn’t return any results

** Note 
If the code to download a photo could throw an error, 
** you would call withThrowingTaskGroup(of:returning:body:) instead
*/

await withTaskGroup(of: Data.self) { group in
    let photoNames = await listPhotos(inGallery: "Summer Vacation")
    for name in photoNames {
        group.addTask {
            return await downloadPhoto(named: name)
        }
    }

    for await photo in group {
        show(photo)
    }
}

/**
For a task group that returns a result, you add code that accumulates 
its result inside the closure you pass to withTaskGroup(of:returning:body:).
Like the previous example, this example creates a child task for each photo to download it. Unlike the previous example, the for-await-in loop waits for the next child task to finish, appends the result of that task to the array of results, and then continues waiting until all child tasks have finished. Finally, the task group returns the array of downloaded photos as its overall result.
*/
let photos = await withTaskGroup(of: Data.self) { group in
    let photoNames = await listPhotos(inGallery: "Summer Vacation")
    for name in photoNames {
        group.addTask {
            return await downloadPhoto(named: name)
        }
    }

    var results: [Data] = []
    for await photo in group {
        results.append(photo)
    }

    return results
}

/**
** Task Cancellation
There are two ways a task can do this: by calling the Task.checkCancellation() method, or by reading the Task.isCancelled property. Calling checkCancellation() throws an error if the task is canceled; a throwing task can propagate the error out of the task, stopping all of the task’s work. This has the advantage of being simple to implement and understand. For more flexibility, use the isCancelled property, which lets you perform clean-up work as part of stopping the task, like closing network connections and deleting temporary files.

** The code makes several changes from the previous version:

Each task is added using the TaskGroup.addTaskUnlessCancelled(priority:operation:) method, to avoid starting new work after cancellation.

Each task checks for cancellation before starting to download the photo. If it has been canceled, the task returns nil.

At the end, the task group skips nil values when collecting the results. Handling cancellation by returning nil means the task group can return a partial result — the photos that were already downloaded at the time of cancellation — instead of discarding that completed work.
*/
let photos = await withTaskGroup(of: Optional<Data>.self) { group in
    let photoNames = await listPhotos(inGallery: "Summer Vacation")
    for name in photoNames {
        group.addTaskUnlessCancelled {
            guard isCancelled == false else { return nil }
            return await downloadPhoto(named: name)
        }
    }

    var results: [Data] = []
    for await photo in group {
        if let photo { results.append(photo) }
    }
    return results
}

/**
For work that needs immediate notification of cancellation, 
use the Task.withTaskCancellationHandler(operation:onCancel:) method
When using a cancellation handler, task cancellation is still cooperative: The task either runs to completion or checks for cancellation and stops early. Because the task is still running when the cancellation handler starts, 
** avoid sharing state between the task and its cancellation handler, which could create a race condition.
*/
let task = await Task.withTaskCancellationHandler {
    // ...
} onCancel: {
    print("Canceled!")
}
// ... some time later...
task.cancel()  // Prints "Canceled!"


/**
** Unstructured Concurrency
In addition to the structured approaches to concurrency described in the previous sections, Swift also supports unstructured concurrency. Unlike tasks that are part of a task group, an unstructured task doesn’t have a parent task. You have complete flexibility to manage unstructured tasks in whatever way your program needs, but you’re also completely responsible for their correctness. To create an unstructured task that runs on the current actor, call the Task.init(priority:operation:) initializer. To create an unstructured task that’s not part of the current actor, known more specifically as a detached task, call the Task.detached(priority:operation:) class method. Both of these operations return a task that you can interact with

For example, to wait for its result or to cancel it.
*/

// let newPhoto = // ... some photo data ...
let handle = Task {
    return await add(newPhoto, toGalleryNamed: "Spring Adventures")
}
let result = await handle.value

/**
** Actors
You can use tasks to break up your program into isolated, concurrent pieces. Tasks are isolated from each other, which is what makes it safe for them to run at the same time, but sometimes you need to share some information between tasks. Actors let you safely share information between concurrent code.

Like classes, actors are reference types, so the comparison of value types and reference types in Classes Are Reference Types applies to actors as well as classes. Unlike classes, actors allow only one task to access their mutable state at a time, which makes it safe for code in multiple tasks to interact with the same instance of an actor.

Here’s an actor that records temperatures:
The TemperatureLogger actor has properties that other code outside the actor can access,
and restricts the max property so only code inside the actor can update the maximum value.
*/
actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int


    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}

/**
Create an instance of an actor . 
When you access a property or method of an actor,
you use await to mark the potential suspension point.
In this code accessing logger.max is a possible suspension point. 
Because the actor allows only one task at a time to access its mutable state,
if code from another task is already interacting with the logger, 
this code suspends while it waits to access the property.
*/
let logger = TemperatureLogger(label: "Outdoors", measurement: 25)
print(await logger.max)
// Prints "25"

// In contrast, code that’s part of the actor doesn’t write await when accessing the actor’s properties.
// Here’s a method that updates a TemperatureLogger with a new temperature:
extension TemperatureLogger {
    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}
/**
The update(with:) method is already running on the actor, so it doesn’t mark its access to properties like max with await. This method also shows one of the reasons why actors allow only one task at a time to interact with their mutable state: Some updates to an actor’s state temporarily break invariants. The TemperatureLogger actor keeps track of a list of temperatures and a maximum temperature, and it updates the maximum temperature when you record a new measurement. In the middle of an update, after appending the new measurement but before updating max, the temperature logger is in a temporary inconsistent state. Preventing multiple tasks from interacting with the same instance simultaneously prevents problems like the following sequence of events:

Your code calls the update(with:) method. It updates the measurements array first.

Before your code can update max, code elsewhere reads the maximum value and the array of temperatures.

Your code finishes its update by changing max.

In this case, the code running elsewhere would read incorrect information because its access to the actor was interleaved in the middle of the call to update(with:) while the data was temporarily invalid. You can prevent this problem when using Swift actors because they only allow one operation on their state at a time, and because that code can be interrupted only in places where await marks a suspension point. Because update(with:) doesn’t contain any suspension points, no other code can access the data in the middle of an update
*/

/*
Accessing logger.max without writing await fails because the properties of an actor are part of that actor’s isolated local state. The code to access this property needs to run as part of the actor, which is an asynchronous operation and requires writing await. Swift guarantees that only code running on an actor can access that actor’s local state. This guarantee is known as actor isolation.

- The following aspects of the Swift concurrency model work together to make it easier to reason about shared mutable state:
- Code in between possible suspension points runs sequentially, without the possibility of interruption from other concurrent code.
- Code that interacts with an actor’s local state runs only on that actor.
- An actor runs only one piece of code at a time.

If code outside the actor tries to access those properties directly, 
like accessing a structure or class’s properties, you’ll get a compile-time error.
*/
print(logger.max)  // Error


/*
Because of these guarantees, code that doesn’t 
include await and that’s inside an actor can make the updates 
without a risk of other places in your program observing the temporarily invalid state. 
The code below converts measured temperatures from Fahrenheit to Celsius:
*/
extension TemperatureLogger {
    func convertFahrenheitToCelsius() {
        measurements = measurements.map { measurement in
            (measurement - 32) * 5 / 9
        }
    }
}

/**
The code above converts the array of measurements, one at a time. While the map operation is in progress, some temperatures are in Fahrenheit and others are in Celsius. However, because none of the code includes await, there are no potential suspension points in this method. The state that this method modifies belongs to the actor, which protects it against code reading or modifying it except when that code runs on the actor. This means there’s no way for other code to read a list of partially converted temperatures while unit conversion is in progress.

In addition to writing code in an actor that protects temporary invalid state by omitting potential suspension points, you can move that code into a synchronous method. The convertFahrenheitToCelsius() method above is a synchronous method, so it’s guaranteed to never contain potential suspension points. This function encapsulates the code that temporarily makes the data model inconsistent, and makes it easier for anyone reading the code to recognize that no other code can run before data consistency is restored by completing the work. In the future, if you try to add concurrent code to this function, introducing a possible suspension point, you’ll get compile-time error instead of introducing a bug.
*/

/**
** Sendable Types
Tasks and actors let you divide a program into pieces that can safely run concurrently. 
Inside of a task or an instance of an actor, the part of a program that contains mutable state,
like variables and properties, is called a concurrency domain.
Some kinds of data can’t be shared between concurrency domains, 
because that data contains mutable state, but it doesn’t protect against overlapping access.

A type that can be shared from one concurrency domain to another is known as a sendable type. 
It can be passed as an argument when calling an actor method or be returned as the result of a task. 
The examples earlier in this chapter didn’t discuss sendability because those examples use simple value types that are always safe to share for the data being passed between concurrency domains. In contrast, some types aren’t safe to pass across concurrency domains. For example, a class that contains mutable properties and doesn’t serialize access to those properties can produce unpredictable and incorrect results when you pass instances of that class between different tasks.

- You mark a type as being sendable by declaring conformance to the Sendable protocol. That protocol doesn’t have any code requirements, but it does have semantic requirements that Swift enforces. In general, there are three ways for a type to be sendable:

- The type is a value type, and its mutable state is made up of other sendable data — , a structure with stored properties that are sendable or an enumeration with associated values that are sendable.

- The type doesn’t have any mutable state, and its immutable state is made up of other sendable data , a structure or class that has only read-only properties.

- The type has code that ensures the safety of its mutable state, like a class that’s marked @MainActor or a class that serializes access to its properties on a particular thread or queue.

- For a detailed list of the semantic requirements, see the Sendable protocol reference.

- Some types are always sendable, like structures that have only sendable properties and enumerations that have only sendable associated values.
*/
struct TemperatureReading: Sendable {
    var measurement: Int
}

extension TemperatureLogger {
    func addReading(from reading: TemperatureReading) {
        measurements.append(reading.measurement)
    }
}

let logger = TemperatureLogger(label: "Tea kettle", measurement: 85)
let reading = TemperatureReading(measurement: 45)
await logger.addReading(from: reading)

// Because TemperatureReading is a structure that has only sendable properties, 
// and the structure isn’t marked public or @usableFromInline, it’s implicitly sendable.


// Here’s a version of the structure where conformance to the Sendable protocol is implied:
struct TemperatureReading {
    var measurement: Int
}

// To explicitly mark a type as not being sendable, 
// overriding an implicit conformance to the Sendable protocol, use an extension
struct FileDescriptor {
    let rawValue: CInt
}


@available(*, unavailable)
extension FileDescriptor: Sendable { }
/**
The code above shows part of a wrapper around POSIX file descriptors. Even though interface for file descriptors uses integers to identify and interact with open files, and integer values are sendable, a file descriptor isn’t safe to send across concurrency domains.

In the code above, the FileDescriptor is a structure that meets the criteria to be implicitly sendable. However, the extension makes its conformance to Sendable unavailable, preventing the type from being sendable.
*/