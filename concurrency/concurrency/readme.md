# Concurrency & Perform asynchronous operations

Swift has built-in support for writing asynchronous and parallel code in a structured way. Asynchronous code can be suspended and resumed later, although only one piece of the program executes at a time. Suspending and resuming code in your program lets it continue to make progress on short-term operations like updating its UI while continuing to work on long-running operations like fetching data over the network or parsing files. Parallel code means multiple pieces of code run simultaneously — for example, a computer with a four-core processor can run four pieces of code at the same time, with each core carrying out one of the tasks. A program that uses parallel and asynchronous code carries out multiple operations at a time, and it suspends operations that are waiting for an external system.

The additional scheduling flexibility from parallel or asynchronous code also comes with a cost of increased complexity. Swift lets you express your intent in a way that enables some compile-time checking — for example, you can use actors to safely access mutable state. However, adding concurrency to slow or buggy code isn’t a guarantee that it will become fast or correct. In fact, adding concurrency might even make your code harder to debug. However, using Swift’s language-level support for concurrency in code that needs to be concurrent means Swift can help you catch problems at compile time.

## Note

If you’ve written concurrent code before, you might be used to working with threads. The concurrency model in Swift is built on top of threads, but you don’t interact with them directly. An asynchronous function in Swift can give up the thread that it’s running on, which lets another asynchronous function run on that thread while the first function is blocked. When an asynchronous function resumes, Swift doesn’t make any guarantee about which thread that function will run on.

## Defining and Calling Asynchronous Functions

An asynchronous function or asynchronous method is a special kind of function or method that can be suspended while it’s partway through execution. This is in contrast to ordinary, synchronous functions and methods, which either run to completion, throw an error, or never return. An asynchronous function or method still does one of those three things, but it can also pause in the middle when it’s waiting for something. Inside the body of an asynchronous function or method, you mark each of these places where execution can be suspended.

To indicate that a function or method is asynchronous, you write the async keyword in its declaration after its parameters, similar to how you use throws to mark a throwing function. If the function or method returns a value, you write async before the return arrow (->). For example, here’s how you might fetch the names of photos in a gallery

## Calling Asynchronous Functions

Because the listPhotos(inGallery:) and downloadPhoto(named:) functions both need to make network requests, they could take a relatively long time to complete. Making them both asynchronous by writing async before the return arrow lets the rest of the app’s code keep running while this code waits for the picture to be ready.

To understand the concurrent nature of the example above, here’s one possible order of execution:

The code starts running from the first line and runs up to the first await. It calls the listPhotos(inGallery:) function and suspends execution while it waits for that function to return.

While this code’s execution is suspended, some other concurrent code in the same program runs. For example, maybe a long-running background task continues updating a list of new photo galleries. That code also runs until the next suspension point, marked by await, or until it completes.

After listPhotos(inGallery:) returns, this code continues execution starting at that point. It assigns the value that was returned to photoNames.

The lines that define sortedNames and name are regular, synchronous code. Because nothing is marked await on these lines, there aren’t any possible suspension points.

The next await marks the call to the downloadPhoto(named:) function. This code pauses execution again until that function returns, giving other concurrent code an opportunity to run.

After downloadPhoto(named:) returns, its return value is assigned to photo and then passed as an argument when calling show(_:).

The possible suspension points in your code marked with await indicate that the current piece of code might pause execution while waiting for the asynchronous function or method to return. This is also called yielding the thread because, behind the scenes, Swift suspends the execution of your code on the current thread and runs some other code on that thread instead. Because code with await needs to be able to suspend execution, only certain places in your program can call asynchronous functions or methods:

Code in the body of an asynchronous function, method, or property.
Code in the static main() method of a structure, class, or enumeration that’s marked with @main.
Code in an unstructured child task, as shown in Unstructured Concurrency below.

```swift
// Assume you have an async function to fetch photo data from a server
func fetchPhotosFromServer(galleryName: String) async -> [String] {
    // Simulate fetching data (replace with actual networking code)
    let photos = ["photo1.jpg", "photo2.jpg", "photo3.jpg"]
    return photos
}

// Usage example
async {
    let galleryName = "Vacation Gallery"
    do {
        let photos = try await fetchPhotosFromServer(galleryName: galleryName)
        print("Photos in \(galleryName):")
        for photo in photos {
            print(photo)
        }
    } catch {
        print("Error fetching photos: \(error)")
    }
}


import Foundation

func listPhotos(inGallery name: String) async -> [String] {
    // Replace this with your actual networking code to retrieve photo names
    // For example, using URLSession or other networking libraries
    
    // Simulating photo names for demonstration purposes
    let simulatedPhotoNames = ["photo1.jpg", "photo2.jpg", "photo3.jpg"]
    
    return simulatedPhotoNames
}

// Example usage:
async {
    let galleryName = "Summer Vacation"
    let photoNames = await listPhotos(inGallery: galleryName)
    let sortedNames = photoNames.sorted()
    
    if let firstPhotoName = sortedNames.first {
        print("First photo name: \(firstPhotoName)")
        // Call your downloadPhoto function here
        // ...
    } else {
        print("No photos found in the gallery.")
    }
}

```

## Tasks and Task Groups

A task is a unit of work that can be run asynchronously as part of your program. All asynchronous code runs as part of some task. A task itself does only one thing at a time, but when you create multiple tasks, Swift can schedule them to run simultaneously.

The async-let syntax described in the previous section implicitly creates a child task — this syntax works well when you already know what tasks your program needs to run. You can also create a task group (an instance of TaskGroup) and explicitly add child tasks to that group, which gives you more control over priority and cancellation, and lets you create a dynamic number of tasks.

Tasks are arranged in a hierarchy. Each task in a given task group has the same parent task, and each task can have child tasks. Because of the explicit relationship between tasks and task groups, this approach is called structured concurrency. The explicit parent-child relationships between tasks has several advantages:

In a parent task, you can’t forget to wait for its child tasks to complete.

When setting a higher priority on a child task, the parent task’s priority is automatically escalated.

When a parent task is canceled, each of its child tasks is also automatically canceled.

Task-local values propagate to child tasks efficiently and automatically.

## Task Cancellation

Swift concurrency uses a cooperative cancellation model. Each task checks whether it has been canceled at the appropriate points in its execution, and responds to cancellation appropriately. Depending on what work the task is doing, responding to cancellation usually means one of the following:

Throwing an error like CancellationError

Returning nil or an empty collection

Returning the partially completed work

Downloading pictures could take a long time if the pictures are large or the network is slow. To let the user stop this work, without waiting for all of the tasks to complete, the tasks need check for cancellation and stop running if they are canceled. There are two ways a task can do this: by calling the Task.checkCancellation() method, or by reading the Task.isCancelled property. Calling checkCancellation() throws an error if the task is canceled; a throwing task can propagate the error out of the task, stopping all of the task’s work. This has the advantage of being simple to implement and understand. For more flexibility, use the isCancelled property, which lets you perform clean-up work as part of stopping the task, like closing network connections and deleting temporary files.

