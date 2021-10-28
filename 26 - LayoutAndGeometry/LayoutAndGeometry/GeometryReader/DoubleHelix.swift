//
//  DoubleHelix.swift
//  LayoutAndGeometry
//
//  Created by Natasha Godwin on 10/27/21.
//

/*
Do child views have to use an amount of space that's less than or equal to the space the parent view offers?
No. Child views are welcome to request more space; and the parent must respect that.

*/
import SwiftUI

struct DoubleHelix: View {
	let colors: [Color] = [.black, .blue, .purple, .red, .pink, .orange, .yellow]
	 var body: some View {
		GeometryReader { fullView in
			ScrollView(.vertical) {
				ForEach(0..<50) { index in
					GeometryReader { geometry in
						Text("Row #\(index)")
							.font(.title)
							.frame(width: fullView.size.width)
							.background(self.colors[index % 7])
							.rotation3DEffect(.degrees(Double(geometry.frame(in: .global).minY - fullView.size.height / 2) / 5), axis: (x: 0, y: 1, z: 0))
					}
					.frame(height: 40)
				}
			}
		}
	}
}

struct DoubleHelix_Previews: PreviewProvider {
	 static var previews: some View {
		  DoubleHelix()
	 }
}
