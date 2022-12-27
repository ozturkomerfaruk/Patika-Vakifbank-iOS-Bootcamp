import Foundation

//High Order Functions

//Map
let arrayOfInt = [2, 3, 4, 5, 4, 7, 2]
var newArr: [Int] = []
for value in arrayOfInt {
    newArr.append(value * 10)
}

print(newArr)

let newArrUsingMap = arrayOfInt.map { $0 * 10 }
print(newArrUsingMap)

arrayOfInt.map( { (someInt: Int) -> Int in return someInt * 10 } )
arrayOfInt.map( { (someInt: Int) in return someInt * 10 } ) //Return type inference
arrayOfInt.map( { someInt in return someInt * 10 } ) //Input type inference
arrayOfInt.map( { someInt in someInt * 10 } ) //Single return statement omit
arrayOfInt.map { $0 * 10 }

//Filter
let arrayOfIntegers = [1, 2, 3, 4, 5, 4, 7, 2]
var newArray: [Int] = []
for value in arrayOfIntegers {
    if value % 2 == 0 {
        newArray.append(value)
    }
}

print(newArray)

newArray = []
newArray = arrayOfIntegers.filter { $0 % 2 == 0 }
print(newArray)

//Reduce
let numbers = [1, 2, 3, 4]
let reducedNumberSum = numbers.reduce(0) { $0 + $1 }
print(reducedNumberSum)

