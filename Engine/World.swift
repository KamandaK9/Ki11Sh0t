//
//  World.swift
//  Engine
//
//  Created by Daniel Senga on 2023/03/29.
//

import Foundation

public struct World {
	public let map: Tilemap
	public var player: Player!
	
	public init(map: Tilemap) {
		self.map = map
		
		for y in 0 ..< map.height {
			for x in 0 ..< map.width {
				let position = Vector(x: Double(x) + 0.5, y: Double(y) + 0.5)
				let thing = map.things[y * map.width + x]
				switch thing {
					case .nothing:
						break
					case .player:
						self.player = Player(position: position)
				}
			}
		}
	}
}

public extension World {
	var size: Vector {
		return map.size
	}
	
	mutating func update(timeStep: Double) {
		player.position += player.velocity * timeStep
		player.position.x.formTruncatingRemainder(dividingBy: size.x)
		player.position.y.formTruncatingRemainder(dividingBy: size.y)
	}
}
