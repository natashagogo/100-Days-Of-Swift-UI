//
//  Polygon.swift
//  Drawing
//
//  Created by Natasha Godwin on 2/22/22.
//

import SwiftUI

struct Polygon: Shape {
	var sides: Int
	
	func path(in rect: CGRect) -> Path {
		let height = Double(min(rect.size.width, rect.size.height)) / 2.0
		let center = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
		var path = Path()
		
		for i in 0..<sides {
			let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180
			let point = CGPoint(
				x: center.x + CGFloat(cos(angle) * height),
				y: center.y + CGFloat(sin(angle) * height))
			
			if i == 0 {
				path.move(to: point) // move to first vertex
			} else {
				path.addLine(to: point) // draw line to next vertex
			}
		}
		path.closeSubpath()
		return path
	}
}
