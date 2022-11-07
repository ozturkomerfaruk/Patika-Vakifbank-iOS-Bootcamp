import Cocoa

func SimpleMode(_ arr: [Int]) -> Int {

    var dict: [String:Int] = [String:Int]()

    var strArr = arr.map {
        String(describing: $0)
    }

    for e in strArr {
        dict[e] = (dict[e] ?? 0) + 1
    }
    
    let keysArr = Array(dict.keys.map{ $0 })
    let valuesArr = Array(dict.values.map{ $0 })

    for (x,y) in valuesArr.enumerated() {
        if y >= 2 {
            return Int(keysArr[x]) ?? 0
        } else {
            return -1
        }
    }
    
    return 0

}

print(SimpleMode([3,3,1,6,10]))
