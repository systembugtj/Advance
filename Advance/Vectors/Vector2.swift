/*

Copyright (c) 2016, Storehouse Media Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/

/// A vector with 2 components.
public struct Vector2 {
    
    /// Component at index `0`
    public var x: Scalar
    
    /// Component at index `1`
    public var y: Scalar
    
    /// Creates a new `Vector2` instance.
    public init(x: Scalar, y: Scalar) {
        self.x = x
        self.y = y
    }
}

extension Vector2: Vector {
    
    /// Creates a vector for which all components are equal to the given scalar.
    public init(scalar: Scalar) {
        x = scalar
        y = scalar
    }

    /// The number of scalar components in this vector type.
    public static var length: Int {
        return 2
    }
    
    /// The empty vector (all scalar components are equal to `0.0`).
    public static var zero: Vector2 {
        return Vector2(x: 0.0, y: 0.0)
    }
    
    public subscript(index: Int) -> Scalar {
        get {
            precondition(index >= 0)
            precondition(index < 2)
            switch index {
            case 0:
                return x
            case 1:
                return y
            default:
                fatalError()
            }
        }
        set {
            precondition(index >= 0)
            precondition(index < 2)
            switch index {
            case 0:
                x = newValue
            case 1:
                y = newValue
            default:
                break
            }
        }
    }
    
    /// Interpolate between the given values.
    public func interpolated(to otherValue: Vector2, alpha: Scalar) -> Vector2 {
        var result = self
        result.interpolate(to: otherValue, alpha: alpha)
        return result
    }
    
    /// Interpolate between the given values.
    public mutating func interpolate(to otherValue: Vector2, alpha: Scalar) {
        x += alpha * (otherValue.x - x)
        y += alpha * (otherValue.y - y)
    }
    
    /// Equatable.
    public static func ==(lhs: Vector2, rhs: Vector2) -> Bool {
        return lhs.x == rhs.x
            && lhs.y == rhs.y
    }
    
    /// Product.
    public static func *(lhs: Vector2, rhs: Vector2) -> Vector2 {
        return Vector2(x: lhs.x*rhs.x, y: lhs.y*rhs.y)
    }
    
    /// Product (in place).
    public static func *=(lhs: inout Vector2, rhs: Vector2) {
        lhs = lhs * rhs
    }
    
    /// Quotient.
    public static func /(lhs: Vector2, rhs: Vector2) -> Vector2 {
        return Vector2(x: lhs.x/rhs.x, y: lhs.y/rhs.y)
    }
    
    /// Quotient (in place).
    public static func /=(lhs: inout Vector2, rhs: Vector2) {
        lhs = lhs / rhs
    }
    
    /// Sum.
    public static func +(lhs: Vector2, rhs: Vector2) -> Vector2 {
        return Vector2(x: lhs.x+rhs.x, y: lhs.y+rhs.y)
    }
    
    /// Sum (in place).
    public static func +=(lhs: inout Vector2, rhs: Vector2) {
        lhs = lhs + rhs
    }
    
    /// Difference.
    public static func -(lhs: Vector2, rhs: Vector2) -> Vector2 {
        return Vector2(x: lhs.x-rhs.x, y: lhs.y-rhs.y)
    }
    
    /// Difference (in place).
    public static func -=(lhs: inout Vector2, rhs: Vector2) {
        lhs = lhs - rhs
    }
    
    /// Scalar-Vector product.
    public static func *(lhs: Scalar, rhs: Vector2) -> Vector2 {
        return Vector2(x: lhs*rhs.x, y: lhs*rhs.y)
    }
}


