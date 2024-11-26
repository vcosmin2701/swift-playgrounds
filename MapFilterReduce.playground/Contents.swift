import Foundation

// Map
// loop over a collection and apply same operation to each
// element in collection

// for-in approach
let values = [2.0, 4.0, 5.0, 7.0]
var squares: [Double] = []
for value in values {
    squares.append(value * value)
}

// shorthand
let squares2 = values.map { $0 * $0 }

// behind-the-hood
let squares3 = values.map({
    (value: Double) -> Double in
    return value * value
})

// another version
let squares4 = values.map { value in value * value }

// type of the result is not limited to the type of elements
// in the original array.

let scores = [0, 28, 124]
let words = scores.map { NumberFormatter.localizedString(from: $0 as NSNumber, number: .spellOut)}

// map operation works with any collection type

let milesToPoint = ["point1":120.0, "point2": 50.0, "point3": 70.0]
let kmToPoint = milesToPoint.map {name, miles in miles * 1.6093}

// Filter

// loop over a collection and return an Array containing only
// the those elements that match an include condition

let digits = [1, 4, 10, 15]
let even = digits.filter { $0 % 2 == 0}

// Reduce

// Combine all items in a collection to create a single new value

let items = [2.0, 4.0, 5.0, 7.0]
let total = items.reduce(10.0, +)

let codes = ["abc", "def", "ghi"]
let text = codes.reduce("", +)

// FlatMap
// apply closure to each element of a sequence

let results = [[5, 2, 7], [4, 8], [9, 1, 3]]
let allResults = results.flatMap { $0 }

let passMarks = results.flatMap { $0.filter { $0 > 5 }}

// FlatMap on an optional
let input: Int? = Int("8")
let passMark: Int? = input.flatMap { $0 > 5 ? $0 : nil }

let keys: [String?] = ["Tom", nil, "Peter", nil, "Harry"]
let validNames = keys.compactMap { $0?.count }

let counts = keys.compactMap { $0?.count }

// Chaining

let marks = [4, 5, 8, 2, 9, 7]
let totalPass = marks.filter{$0 >= 7}.reduce(0, +)

let numbers = [20, 17, 35, 4, 12]
let evenSquares = numbers.filter{$0 % 2 == 0}.map{$0 * $0}
