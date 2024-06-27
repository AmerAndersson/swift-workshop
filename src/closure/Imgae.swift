class ImageFile {
    var fileName: String
    var fileID: Int

    init(fileName: String, fileID: Int) {
        self.fileName = fileName
        self.fileID = fileID
    }
}

// Create an array of ImageFile objects
var images: [ImageFile] = []

// Add some ImageFile instances to the array
let image1 = ImageFile(fileName: "image1.png", fileID: 101)
let image2 = ImageFile(fileName: "image2.png", fileID: 202)
images.append(image1)
images.append(image2)

// Sort the images array by 'fileID' in ascending order
let sortedImages = images.sorted { $0.fileID < $1.fileID }

// Now sortedImages contains the ImageFile objects sorted by fileID
print(sortedImages)
print("-------------------")

// Suppose we have an array of names
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// We want to sort the names in reverse alphabetical order
let sortedNames = names.sorted { (name1, name2) in
    return name1 > name2
}
for nameSorted1 in sortedNames {
    print(nameSorted1, terminator: " ")
}
print("")
// Using trailing closure syntax:
let shorterSortedNames = names.sorted { $0 > $1 }
for nameSorted2 in shorterSortedNames {
    print(nameSorted2, terminator: " ")
}
print("")
// Output: ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
