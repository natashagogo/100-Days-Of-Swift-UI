//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Natasha Godwin on 10/25/21.
//

import SwiftUI

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
