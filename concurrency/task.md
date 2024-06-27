# Overview

```swift

@frozen
struct Task<Success, Failure> where Success : Sendable, Failure : Error
Overview
When you create an instance of Task, you provide a closure that contains the work for that task to perform. Tasks can start running immediately after creation; you don’t explicitly start or schedule them. After creating a task, you use the instance to interact with it — for example, to wait for it to complete or to cancel it. It’s not a programming error to discard a reference to a task without waiting for that task to finish or canceling it. A task runs regardless of whether you keep a reference to it. However, if you discard the reference to a task, you give up the ability to wait for that task’s result or cancel the task.

To support operations on the current task, which can be either a detached task or child task, Task also exposes class methods like yield(). Because these methods are asynchronous, they’re always invoked as part of an existing task.

Only code that’s running as part of the task can interact with that task. To interact with the current task, you call one of the static methods on Task.

A task’s execution can be seen as a series of periods where the task ran. Each such period ends at a suspension point or the completion of the task. These periods of execution are represented by instances of PartialAsyncTask. Unless you’re implementing a custom executor, you don’t directly interact with partial tasks.

For information about the language-level concurrency model that Task is part of, see Concurrency in The Swift Programming Language.

Task Cancellation
Tasks include a shared mechanism for indicating cancellation, but not a shared implementation for how to handle cancellation. Depending on the work you’re doing in the task, the correct way to stop that work varies. Likewise, it’s the responsibility of the code running as part of the task to check for cancellation whenever stopping is appropriate. In a long-task that includes multiple pieces, you might need to check for cancellation at several points, and handle cancellation differently at each point. If you only need to throw an error to stop the work, call the Task.checkCancellation() function to check for cancellation. Other responses to cancellation include returning the work completed so far, returning an empty result, or returning nil.

Cancellation is a purely Boolean state; there’s no way to include additional information like the reason for cancellation. This reflects the fact that a task can be canceled for many reasons, and additional reasons can accrue during the cancellation process.

Task closure lifetime
Tasks are initialized by passing a closure containing the code that will be executed by a given task.

After this code has run to completion, the task has completed, resulting in either a failure or result value, this closure is eagerly released.

Retaining a task object doesn’t indefinitely retain the closure, because any references that a task holds are released after the task completes. Consequently, tasks rarely need to capture weak references to values.

For example, in the following snippet of code it is not necessary to capture the actor as weak, because as the task completes it’ll let go of the actor reference, breaking the reference cycle between the Task and the actor holding it.

struct Work: Sendable {}


actor Worker {
    var work: Task<Void, Never>?
    var result: Work?


    deinit {
        assert(work != nil)
        // even though the task is still retained,
        // once it completes it no longer causes a reference cycle with the actor


        print("deinit actor")
    }


    func start() {
        work = Task {
            print("start task work")
            try? await Task.sleep(for: .seconds(3))
            self.result = Work() // we captured self
            print("completed task work")
            // but as the task completes, this reference is released
        }
        // we keep a strong reference to the task
    }
}
And using it like this:

await Actor().start()
Note that there is nothing, other than the Task’s use of self retaining the actor, And that the start method immediately returns, without waiting for the unstructured Task to finish. So once the task completes and its the closure is destroyed, the strong reference to the “self” of the actor is also released allowing the actor to deinitialize as expected.

Therefore, the above call will consistently result in the following output:

start task work
completed task work
deinit actor


## Overview
 protocol Sendable
A type whose values can safely be passed across concurrency domains by copying.

You can safely pass values of a sendable type from one concurrency domain to another — for example, you can pass a sendable value as the argument when calling an actor’s methods. All of the following can be marked as sendable:

Value types

Reference types with no mutable storage

Reference types that internally manage access to their state

Functions and closures (by marking them with @Sendable)

Although this protocol doesn’t have any required methods or properties, it does have semantic requirements that are enforced at compile time. These requirements are listed in the sections below. Conformance to Sendable must be declared in the same file as the type’s declaration.

To declare conformance to Sendable without any compiler enforcement, write @unchecked Sendable. You are responsible for the correctness of unchecked sendable types, for example, by protecting all access to its state with a lock or a queue. Unchecked conformance to Sendable also disables enforcement of the rule that conformance must be in the same file.

For information about the language-level concurrency model that Task is part of, see Concurrency in The Swift Programming Language.

Sendable Structures and Enumerations
To satisfy the requirements of the Sendable protocol, an enumeration or structure must have only sendable members and associated values. In some cases, structures and enumerations that satisfy the requirements implicitly conform to Sendable:

Frozen structures and enumerations

Structures and enumerations that aren’t public and aren’t marked @usableFromInline.

Otherwise, you need to declare conformance to Sendable explicitly.

Structures that have nonsendable stored properties and enumerations that have nonsendable associated values can be marked as @unchecked Sendable, disabling compile-time correctness checks, after you manually verify that they satisfy the Sendable protocol’s semantic requirements.

Sendable Actors
All actor types implicitly conform to Sendable because actors ensure that all access to their mutable state is performed sequentially.

Sendable Classes
To satisfy the requirements of the Sendable protocol, a class must:

Be marked final

Contain only stored properties that are immutable and sendable

Have no superclass or have NSObject as the superclass

Classes marked with @MainActor are implicitly sendable, because the main actor coordinates all access to its state. These classes can have stored properties that are mutable and nonsendable.

Classes that don’t meet the requirements above can be marked as @unchecked Sendable, disabling compile-time correctness checks, after you manually verify that they satisfy the Sendable protocol’s semantic requirements.

Sendable Functions and Closures
Instead of conforming to the Sendable protocol, you mark sendable functions and closures with the @Sendable attribute. Any values that the function or closure captures must be sendable. In addition, sendable closures must use only by-value captures, and the captured values must be of a sendable type.

In a context that expects a sendable closure, a closure that satisfies the requirements implicitly conforms to Sendable — for example, in a call to Task.detached(priority:operation:).

You can explicitly mark a closure as sendable by writing @Sendable as part of a type annotation, or by writing @Sendable before the closure’s parameters — for example:

let sendableClosure = { @Sendable (number: Int) -> String in
    if number > 12 {
        return "More than a dozen."
    } else {
        return "Less than a dozen"
    }
}