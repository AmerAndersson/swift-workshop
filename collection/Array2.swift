// an empty fruits 
var fruits: [String] = []
fruits.append("blueberries")
fruits.append("Apple")
fruits.append("Banana")
fruits.append("Orange")
for fruit in fruits{
print(fruit)
}
print("---------------------------") 

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])
print("---------------------------") 

var albums = Array<String>()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
for album in albums{
print(album)
}
print("---------------------------") 

var album = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
for alb in album{
print(alb)
}
print("---------------------------") 

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)
print("---------------------------") 

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))
 

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())


let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)
print("---------------------------") 
// store ordered data in arrays
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

print(beatles[0])
print(numbers[1])
print(temperatures[2])

var employee = ["Taylor Swift", "Singer", "Nashville"]
print("Name: \(employee[0])")
print("Job title: \(employee[1])")
print("Location: \(employee[2])")
print("---------------------------") 
