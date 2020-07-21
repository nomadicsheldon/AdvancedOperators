import UIKit

// Bitwise Operators

// Not operator
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits
/*
 input - 00001111
 output - 11110000
 */

// And operator
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits
/*
input - 11111100
        00111111
output- 00111100
*/

// Or operator
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinebits = someBits | moreBits
/*
 input - 10110010
         01011110
 output- 11111110
 */

// XOR operator
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let output = firstBits ^ otherBits
/*
input - 00010100
        00000101
output- 00010001
*/

// Left and Right Shift Operators

// Unsigned Integers
let shiftBits: UInt8 = 0b00000100  // 00000100
shiftBits << 1  // 00001000
shiftBits << 2  // 00010000
shiftBits << 5  // 10000000
shiftBits << 6  // 00000000
shiftBits >> 2  // 00000001

// you can use bit shifting to encode and decode values within other data types
let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16
let greenComponent = (pink & 0xFF0000) >> 8
let blueComponent = pink & 0x0000FF

// Shifting behaviour of signed integer - Read Documentation

//--------------------------------------------------------------------------------------------------//

// Overflow Operators
var potentialOverFlow = Int16.max

//potentialOverFlow += 1 // cause an error limit is only - 32767

/*
 * overflow addition (&+)
 * overflow substraction (&-)
 * overflow multiplication (&*)
 */

// value overflow

var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 1
/*
input - 11111111
               1
output- 1 | 00000000 = 0
*/

var unsignedOverflowMin = UInt8.min
unsignedOverflowMin = unsignedOverflowMin &- 1
/*
input - 00000000
               1
output- 11111111 = 255
*/

var signedOverflowMin = UInt8.min
signedOverflowMin = signedOverflowMin &- 1
/*
input - 10000000  // first for signed integer
               1
output- 01111111 = 127
*/

//--------------------------------------------------------------------------------------------------//

// Precedence and Associativity

let val = 2 + ((3 % 4)*5)  // 2 + 3 % 4*5

//--------------------------------------------------------------------------------------------------//
// Operator Methods

struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

// Prefix and Postfix Operators

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
    
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive

let alsoPositive = -negative

// Compound Assignment Operators

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
        
    }
}

var origin = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
origin += vectorToAdd

// Equivalence Operators

extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("equal")
} else {
    print("not equal")
}

//--------------------------------------------------------------------------------------------------//
// Custom Operators

prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var tobeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++tobeDoubled

// Precedence for custom infix Operators

infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
