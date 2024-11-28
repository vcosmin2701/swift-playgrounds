import Foundation

// Example of Generics

func compareNums<T: Comparable>(x: T, y: T) -> T {
    return x > y ? x : y
}

print(compareNums(x: 10, y: 20))
print(compareNums(x: 2.4, y: 2.1))


func tripleValues<T: Numeric>(in nums: [T]) -> [T] {
    return nums.map { $0 * 3}
}

print(tripleValues(in: [1, 2, 3]))
print(tripleValues(in: [1.5, 2.2, 3.4]))

// Generics on Structs

struct BestDeal<Price: Comparable> {
    let price1: Price
    let price2: Price
    
    func decemberOffer() -> Price {
        return self.price1 < self.price2 ? self.price1 : self.price2
    }
}

let appleWatch: BestDeal<Double> = BestDeal(price1: 1200.99, price2: 999.99)
print(appleWatch.decemberOffer())

// Associated Types

protocol ValuePrinting {
    associatedtype T
    var value: T { get }
    func printValue()
}

struct StringPrinter: ValuePrinting {
    let value: String
    
    func printValue() {
        print("My string value is \(value)")
    }
}

struct DoublePrinter: ValuePrinting {
    let value: Double
    
    func printValue() {
        print("My double value is \(value)")
    }
}

var string1 = StringPrinter(value: "twenty")
var double1 = DoublePrinter(value: 27.1)

print(string1.printValue())
print(double1.printValue())


// Opaque types

let favoriteNumer: Int = 7
let length: Double = 423.4
let purchase: String = "chair"

let describableThings: [CustomStringConvertible] = [5, "hello", [1, 2, 3]]

for thing in describableThings {
    print(thing.description)
}

// return types in functions

func getDescribableThing() -> CustomStringConvertible {
    return Bool.random() ? "hello" : 3
}

print(getDescribableThing())

// return an opaque type
// returns something that conforms to hashable

func getHashableThing() -> some Hashable {
    return Bool.random() ? "hello" : "hey"
}
