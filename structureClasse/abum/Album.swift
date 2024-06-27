struct Album {
  let title: String 
  let artist: String 
  let year: Int 
  
  func artistSummary(){
    print("Album: \(title), Year: \(year), by \(artist).")
  }

}

let red =  Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

red.artistSummary()
wings.artistSummary()

//print(red.title)
//print(red.artist)
//print(red.year)
print()

struct Employee {
  let name: String 
  var vacationRemaining: Int 

  mutating func takeVacation(days: Int) {
    if vacationRemaining > days {
      vacationRemaining -= days 
      print("I'm going on vacation!")
      print("Days remaining: \(vacationRemaining)")
    } else {
      print("Oops! There aren't enough days remaining.")
    }
  }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
//print(archer.vacationRemaining)