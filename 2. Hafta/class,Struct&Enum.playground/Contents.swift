import Cocoa

//Definition Structs & Class
struct Resolution {
    var width = 0
    var heigth = 0
    mutating func lowResolution() {
        self.width = 320
        self.heigth = 240
        print("\(self.width) & \(self.heigth) -> lowResolution mutated")
    }
}

class VideoMode {
    var resolution = Resolution()
    var frameRate = 0.0
    var name: String?
}

//Instances
var someResoluiton = Resolution()
var vga = Resolution(width: 640, heigth: 480)
let someVideoMode = VideoMode()

//Accessing Properties
someVideoMode.resolution.width = 1280
print("The width of someResolution is \(someResoluiton.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

//Struct & Enum are Value Types
var hd = Resolution(width: 1920, heigth: 1080)
var cinema = hd
cinema.width = 2048
print("hd is now \(hd.width)")
print("cinema is now \(cinema.width)")
hd.lowResolution()
print("hd is now low and low resolution is \(hd.width)-\(hd.heigth)")

enum CompassDirection {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassDirection.west
let remmemberDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(remmemberDirection)")

//Class is Referance Type
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
var newLowHP = Resolution()
newLowHP.lowResolution()
alsoTenEighty.resolution = newLowHP
alsoTenEighty.frameRate = 30.0
alsoTenEighty.name = "240p"

print("The frameRate property of tenEighty is now \(tenEighty.frameRate) & \(tenEighty.resolution.heigth) heigth")
print("The frameRate property of alsoTenEighty is now \(alsoTenEighty.frameRate) & \(alsoTenEighty.resolution.heigth) heigth")

