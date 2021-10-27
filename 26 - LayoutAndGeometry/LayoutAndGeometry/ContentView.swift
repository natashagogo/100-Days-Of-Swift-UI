//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Natasha Godwin on 10/25/21.
//

import SwiftUI

/*
The true method of knowledge is experiment. - William Blake

What does GeometryReader do?

It determines the size and location of views, relative to its own size and location.

Keep in mind that the view that gets return has a flexible preferred size, meaning it will expand to take up more space as needed.

What does the frame(in: ) method of GeometryReader do?
It calculates the view's current position in whatever coordinate space (global, local, etc.) you ask for.

Consider the following code:

struct ContentView: View {
	var body: some View {
		Text("Hello, World!")
	}
}

Why is the text view centered on the screen?

How do you absolutely position a SwiftUI view?
Use the .position() modifier.

What does the .position() modifier do?
It positions a view at specific x and y coordinates within its parent.
Keep in mind this modifier creates a new view that takes up all of the available space, so it can position its child at the correct location.

Consider this code:

struct ContentView: View {
	var body: some View {
		Text("Hello, World!")
			.offset(x: 100, y: 100)
			.background(Color.blue)
	}
}

What result will you get? And why will you get it?

The background and text will be in two different locations. The reason is that when you use offset(), you change a view's location, but not it's underlying geometry. This means that background() will use the original position of the text, i.e. the center of the screen, not its offset.

If you want the background to appear behind the text, put the background modifier before offset.

*/



struct ContentView: View {
    var body: some View {
			NavigationView {
				List {
					NavigationLink(destination: OffSetText()) {
						VStack(alignment: .leading, spacing: 5) {
							Text(".offset()")
								.font(.headline)
							Text("Move text within a frame")
								.font(.caption)
						}
					}
					NavigationLink(destination: StaggeredText()) {
						VStack(alignment: .leading, spacing: 5) {
							Text(".alignmentGuide()")
								.font(.headline)
							Text("Stagger text within a frame")
								.font(.caption)
						}
					}
					NavigationLink(destination: SameBaseline()) {
						VStack(alignment: .leading, spacing: 5) {
							Text(".lastTextBaseline")
								.font(.headline)
							Text("Put text of different sizes on the same baseline.")
								.font(.caption)
						}
					}
					NavigationLink(destination: OffsetVersusAlignment()) {
						VStack(alignment: .leading, spacing: 5) {
							Text(".offset() versus .alignmentGuide()")
								.font(.headline)
							Text("Compare alignment methods")
								.font(.caption)
						}
					}
					NavigationLink(destination: DoubleHelix()) {
						VStack(alignment: .leading, spacing: 5) {
							Text("GeometryReader Effects, Part 1")
								.font(.headline)
							Text("Create a rotating double helix")
								.font(.caption)
						}
					}
					NavigationLink(destination: SlidingSquares()) {
						VStack(alignment: .leading, spacing: 5) {
							Text("GeometryReader Effects, Part 2")
								.font(.headline)
							Text("Create a row of sliding squares")
								.font(.caption)
						}
					}
				}
				.navigationTitle("Layout in SwiftUI")
		}
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
