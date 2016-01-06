// Find the sum of all even numbers between 1 and 10

// non functional
var evens = [Int]()
for i in 1...10 {
  if i % 2 == 0 {
    evens.append(i)
  }
}

var evenSum = 0
for i in evens {
  evenSum += i
}
print(evenSum)

// functional
evenSum = Array(1...10)
  .filter { (number) in number % 2 == 0 }
  .reduce(0) { (total, number) in total + number }
print(evenSum)

// Further reduce examples - the maximum numbr in an integer array
let maxNumber = Array(1...10)
  .reduce(0) { (total, number) in max(total, number) }
print(maxNumber)

// reducing an array of integers into a string
let numbers = Array(1...10)
  .reduce("numbers: ") { (total, number) in total + "\(number) " }
print(numbers)


// the 'magic' behind reduce
extension Array {
  func myReduce<T, U>(seed:U, combiner:(U, T) -> U) -> U {
    var current = seed
    for item in self {
      current = combiner(current, item as! T)
    }
    return current
  }
}

let usingMyReduce = Array(1...10)
  .filter { $0 % 2 == 0 }
  .myReduce(0) { $0 + $1 }
print(usingMyReduce)
