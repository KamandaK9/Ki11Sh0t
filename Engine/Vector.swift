//
//  Vector.swift
//  Engine
//
//  Created by Daniel Senga on 2023/03/29.
//

import Foundation


public struct Vector {
	public var x, y: Double
	
	public init(x: Double, y: Double) {
		self.x = x
		self.y = y
	}
}

public extension Vector {
	static func + (lhs: Vector, rhs: Vector) -> Vector {
		return Vector(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
	}
	
	static func - (lhs: Vector, rhs: Vector) -> Vector {
		return Vector(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
	}
	
	static func * (lhs: Vector, rhs: Double) -> Vector {
		return Vector(x: lhs.x * rhs, y: lhs.y * rhs)
	}
	
	static func / (lhs: Vector, rhs: Double) -> Vector {
		return Vector(x: lhs.x / rhs, y: lhs.y / rhs)
	}
	
	static func * (lhs: Double, rhs: Vector) -> Vector {
		return Vector(x: lhs * rhs.x, y: lhs * rhs.y)
	}
	
	static func / (lhs: Double, rhs: Vector) -> Vector {
		return Vector(x: lhs / rhs.x, y: lhs / rhs.y)
	}
	
	static func += (lhs: inout Vector, rhs: Vector) {
		lhs.x += rhs.x
		lhs.y += rhs.y
	}
	
	static func -= (lhs: inout Vector, rhs: Vector) {
		lhs.x -= rhs.x
		lhs.y -= rhs.y
	}
	
	static func *= (lhs: inout Vector, rhs: Double) {
		lhs.x *= rhs
		lhs.y *= rhs
	}
	
	static func /= (lhs: inout Vector, rhs: Double) {
		lhs.x /= rhs
		lhs.y /= rhs
	}
	
	static prefix func - (rhs: Vector) -> Vector {
		return Vector(x: -rhs.x, y: -rhs.y)
	}
}
