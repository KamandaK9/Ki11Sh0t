//
//  ViewController.swift
//  Ki11Sh0t
//
//  Created by Daniel Senga on 2023/03/29.
//

import UIKit
import Engine


class ViewController: UIViewController {
	private let imageView = UIImageView()
	private var world = World(map: loadMap())
	private var lastFrameTime = CACurrentMediaTime()

	override func viewDidLoad() {
		super.viewDidLoad()
		setUpImageView()
		
		let displayLink = CADisplayLink(target: self, selector: #selector(update))
		displayLink.add(to: .main, forMode: .common)
		
		imageView.layer.magnificationFilter = .nearest
	}
	
	
	func setUpImageView() {
		view.addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
		imageView.contentMode = .scaleAspectFit
		imageView.backgroundColor = .black
	}
	
	@objc func update(_ displayLink: CADisplayLink) {
		let timeStep = displayLink.timestamp - lastFrameTime
		world.update(timeStep: timeStep)
		lastFrameTime = displayLink.timestamp
		
		let size = Int(min(imageView.bounds.width, imageView.bounds.height))
		var renderer = Renderer(width: size, height: size)
		renderer.draw(world)
		
		imageView.image = UIImage(bitmap: renderer.bitmap)
	}
	
	

}

private func loadMap() -> Tilemap {
	let jsonURL = Bundle.main.url(forResource: "Map", withExtension: "json")!
	let jsonData = try! Data(contentsOf: jsonURL)
	return try! JSONDecoder().decode(Tilemap.self, from: jsonData)
}


