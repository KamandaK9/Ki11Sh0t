//
//  Rect.swift
//  Engine
//
//  Created by Daniel Senga on 2023/03/29.
//

import Foundation

public struct Rect {
	var min, max: Vector
	
	public init(min: Vector, max: Vector) {
		self.min = min
		self.max = max
	}
}
