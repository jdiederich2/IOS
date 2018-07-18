//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let label = "The width is "
let width = 94
let widthLabel = label + String(width)
widthLabel

let apples = 3
let oranges = 5
let appleSummary = "I ahve \(apples) apples."
let fruitSummary = "I ahve \(apples + oranges) pieces of fruti"

let myName = "Jen"
let Greeting = "Hello \(myName), how are you today?"

let quotation = """
Even though there's whitespace to the left, the actual lines aren't indented. Except for this line.
Double quotes (") can appear without being escaped.

I still have \(apples + oranges) pieces of fruit.
"""

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
shoppingList

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]

occupations["Jayne"] = "Public Relations"
occupations

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print(teamScore)

var optionalString: String? = "hello"
print(optionalString == nil)

var optionalName: String?
var greeting = "hello!"
if let name = optionalName {
    greeting = "hello, \(name)"
}

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

let vegetable = "celery"
switch vegetable {
case "celery":
    print("add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasPrefix("red"):
    print("Is it a spicy \(x)?")
default:
    print("everything tastes good in soup.")
    
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 10
var kindOfNumber = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        
        if number < largest {
            largest = number
            kindOfNumber = kind
        }
    }
}

print(kindOfNumber, largest)

var total = 0
for i in 0..<4 {
    total += i
}

print(total)

func greet (_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}

greet("Jen", on: "wednesday")


func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])

print(statistics.sum)
print(statistics.2)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()


func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
    
}

var increment = makeIncrementer()
increment(9)


func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)


let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)

let sortedNumbers = numbers.sorted {$0 > $1 }
print(sortedNumbers)


// Create a class
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shpae with \(numberOfSides) sides."
    }
}

// Instantiate a class
var shape = Shape()
shape.numberOfSides =7
var shapeDescription = shape.simpleDescription()

// Class creation
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return 3.14159 * (radius * radius)
    }
    
    override func simpleDescription() -> String {
        return "A circle with a radius of \(radius)."
    }
}

let testCircle = Circle(radius: 5.5, name: "Circle")
testCircle.area()
testCircle.simpleDescription()










