import Cocoa

// Part 1: create a two-dimensional array with nested brackets.
let points: [[Int]] = [[10, 20], [30, 40]]

// Part 2: access all individual elements.
print(points[0][0])
print(points[0][1])
print(points[1][0])
print(points[1][1])

// Create a constant, jagged array.
let units: [[Int]] = [[100, 200, 300], [400, 500], [600]]

// Loop over array and all nested arrays.
for x in 0..<units.count {
    var line = ""
    for y in 0..<units[x].count {
        line += String(units[x][y])
        line += " "
    }
    print(line)
}

// An empty 2D string array.
var codes = [[String]]()

// Create first string array.
// ... Append it to the codes 2D array.
var row1 = [String]()
row1.append("C1")
row1.append("A1")

codes.append(row1)

// Create the second string array row.
var row2 = [String]()
row2.append("T2")
row2.append("S2")

codes.append(row2)

// Display our 2D string array.
print(codes)

// Create a three-dimensional array.
// ... The outer array contains two arrays.
// ... Those two arrays both contain two arrays.
// ... The inner arrays have two values each.
let parts: [[[Int]]] = [[[1, 2], [3, 4]],
                        [[5, 6], [7, 8]]]

for a in 0..<parts.count {
    // Print index of first dimension.
    print("Outer = \(a)")
    // Display inner two arrays.
    for b in 0..<parts[a].count {
        var line = ""
        for c in 0..<parts[a][b].count {
            line += String(parts[a][b][c])
        }
        print(line)
    }
    print("")
}

class WorldMap {
    var storage = [[Int]]()
    init() {
        // Create a 100 by 100 two-dimensional array.
        // ... Use append calls.
        for _ in 0..<100 {
            var subArray = [Int]()
            for _ in 0..<100 {
                subArray.append(0)
            }
            storage.append(subArray)
        }
    }
    subscript(row: Int, column: Int) -> Int {
        get {
            // This could validate arguments.
            return storage[row][column]
        }
        set {
            // This could also validate.
            storage[row][column] = newValue
        }
    }
}


// Create our class and use its subscript.
// ... This modifies its two-dimensional Int array.
var world = WorldMap()
world[0, 5] = 100 // Set.
world[9, 9] = 120
world[99, 99] = world[0, 5]

print(world[0, 0]) // Get.
print(world[0, 5])
print(world[9, 9])
print(world[99, 99])
