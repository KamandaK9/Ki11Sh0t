//
//  Tile.swift
//  Engine
//
//  Created by Daniel Senga on 2023/03/29.
//

import Foundation

public enum Tile: Int, Decodable {
	case floor
	case wall
}

public extension Tile {
	var isWall: Bool {
		switch self {
			case .wall:
				return true
			case .floor:
				return false
		}
	}
}
