listPhotos(inGallery: "Summer Vacation") { photoNames in
    let sortedNames = photoNames.sorted()
    let name = sortedNames[0]
    downloadPhoto(named: name) { photo in
        show(photo)
    }
}
// However, there’s a very important difference. 
// You can wrap throwing code in a do-catch block to handle errors, or
// use Result to store the error for code elsewhere to handle it. 
// These approaches let you call throwing functions from nonthrowing code. 

func availableRainyWeekendPhotos() -> Result<[String], Error> {
    return Result {
        try listDownloadedPhotos(inGallery: "A Rainy Weekend")
    }
}

/** 
In contrast, there’s no safe way to wrap asynchronous code so you can call it from synchronous code and wait for the result. The Swift standard library intentionally omits this unsafe functionality — trying to implement it yourself can lead to problems like subtle races, threading issues, and deadlocks. When adding concurrent code to an existing project, work from the top down. Specifically, start by converting the top-most layer of code to use concurrency, and then start converting the functions and methods that it calls, working through the project’s architecture one layer at a time. There’s no way to take a bottom-up approach, because synchronous code can’t ever call asynchronous code.
*/
