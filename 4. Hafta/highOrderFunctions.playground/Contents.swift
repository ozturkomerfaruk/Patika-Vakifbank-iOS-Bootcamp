import Cocoa

//Map
let arrayOfInt = [2, 3, 4, 5, 4, 7, 2]
var newArr: [Int]
newArr = arrayOfInt.map( { (someInt: Int) -> Int in return someInt * 10 } )
newArr = arrayOfInt.map( { (someInt: Int) in return someInt * 10 } ) //Return type inference
newArr = arrayOfInt.map( { someInt in return someInt * 10 } ) //Input type inference
newArr = arrayOfInt.map( { someInt in someInt * 10 } ) //Single return statement omit
newArr = arrayOfInt.map { $0 * 10 }

print(newArr)

//Filter
let arrayOfIntegers = [1, 2, 3, 4, 5, 4, 7, 2]
newArr = []
newArr = arrayOfIntegers.filter { $0 % 2 == 0 }

print(newArr)

//Reduce
let numbers = [1, 2, 3, 4]
let reducedNumberSum = numbers.reduce(-5) { $0 + $1 } //Initial value = -5
print(reducedNumberSum)
 
