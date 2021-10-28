//
//  ShrinkImage.swift
//  LayoutAndGeometry
//
//  Created by Natasha Godwin on 10/28/21.
//

import SwiftUI

// Make the image get smaller, as the user scrolls down.

struct ShrinkImage: View {
    var body: some View {
		GeometryReader { geometry in
			List {
				ForEach(0..<10) {_ in
					Image(decorative: "example")
						.resizable()
						.scaledToFit()
						.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
						.frame(maxWidth: geometry.size.width * 0.2)
						.scaleEffect() // What goes here?
				}
			}
		}
    }
}

struct ShrinkImage_Previews: PreviewProvider {
    static var previews: some View {
        ShrinkImage()
    }
}
