import UIKit

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "Uma forma com \(numberOfSides) lados."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapedDescription = shape.simpleDescription()

class NamedShape {
    var numberOfSide: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "Uma forma com \(numberOfSide) lados."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSide = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "Um quadrado com lados de comprimento \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "meu quadrado de teste")
test.area()
test.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    var perimeter: Double {
        get { return 3.0 * sideLength }
        set { sideLength = newValue / 3.0 }
    }
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSide = 3
    }
    
    override func simpleDescription() -> String {
        return "Um triângulo equilátero com lados de comprimento \(sideLength)"
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "um triângulo")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    
    var triangle: EquilateralTriangle {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "outra forma de teste")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "quadrado maior")
print(triangleAndSquare.triangle.sideLength)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "quadrado opcional")
let sideLength = optionalSquare?.sideLength
