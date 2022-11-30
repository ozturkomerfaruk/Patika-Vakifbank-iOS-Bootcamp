import Cocoa

//1.Palindrome
var value = "ababa!%"

func palindromeChecker(to value: String) {
    let characterSet = CharacterSet(charactersIn: "!'+%")
    let joinedString = value.components(separatedBy: characterSet).joined()
    let result = joinedString.lowercased()
    
    if result == String(result.reversed()) {
        print("\(value) is palindrome")
    } else {
        print("\(value) is not palindrome")
    }
}
palindromeChecker(to: value)

//2. Element Count
func elementCount(array: [AnyHashable]) {
    //let stringMappedArray = array.map({ String(describing: $0) })
    let initialTupleArray = array.map({ ($0, 1) })
    let countedDictionary = Dictionary(initialTupleArray ,uniquingKeysWith: +)
    print(countedDictionary)
}

elementCount(array: ["a", 1, 3, 3, 3, 2, true, "a", "c", "true"])

//3. Left Pyramid & 4. Diamond
func makeLeftPyramid(number: Int) {
    guard number > 0 else { return }
    var star = String()
    for i in 1...number {
        for _ in 1...i {
            star += "*"
        }
        star += "\n"
    }
    print(star)
}

makeLeftPyramid(number: 10)

func makeCenterPyramid(number: Int) {
    guard number > 0 else { return }
    var star = String()
    for i in 1...number {
        for _ in 1...number + 1 - i {
            star += " "
        }
        for _ in 1...i {
            star += "* "
        }
        star += "\n"
    }
    print(star)
}

makeCenterPyramid(number: 5)

//5.1 Multiple 3 or 5
func multipleThreeOrFiveSum(to number: Int) -> Int {
    guard number > 0 else { return 0 }
    var sum: Int = 0
    for n in 1...number - 1 {
        if n % 3 == 0 || n % 5 == 0 {
            sum += n
        }
    }
    return sum
}

multipleThreeOrFiveSum(to: 1000)

//5.2 Even Fibonacci Numbers
func sumEvenFibonacciNumbers(to value: Int) -> Int {
    var first = 0
    var second = 1
    var result = 0
    var evenSum = 0
    
    while result <= value {
        result = first + second
        first = second
        second = result
        
        if result % 2 == 0 {
            evenSum += result
        }
    }
    
    return evenSum
}

sumEvenFibonacciNumbers(to: 4000000)

//5.3 Largest Prime Factor
//All numbers can be expressed as the product of primes
//102 = 2 x 3 x 17
//712 = 2 x 2 x 2 x 89
func findLargestPrimeFactor(num: Int) -> Int {
    var numToFactor = num
    var primeFactor = 2
    
    while numToFactor > 1 {
        if numToFactor % primeFactor == 0 {
            numToFactor /= primeFactor
        } else {
            primeFactor += 1
        }
    }
    return primeFactor
}

findLargestPrimeFactor(num: 600851475143)
