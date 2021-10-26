//
//  OffsetVersusAlignment.swift
//  LayoutAndGeometry
//
//  Created by Natasha Godwin on 10/26/21.
//

import SwiftUI

struct OffsetVersusAlignment: View {
	var body: some View {
		ScrollView(.vertical) {
			VStack(alignment: .leading) {
				Text("Offset")
					.font(.headline)
				VStack(alignment: .trailing, spacing: 5) {
					Text("Never pretend to be")
					Text("a unicorn")
						.offset(x: 50.0, y: 0)
					Text("by sticking a plunger")
					Text("on your head.")
				}
				.background(Color.white)
				.frame(width: 300, height: 300)
				.background(Color.blue)
			}.padding(5)
			VStack(alignment: .leading) {
				Text("Alignment Guide")
					.font(.headline)
				VStack(alignment: .trailing, spacing: 5) {
					Text("Never pretend to be")
					Text("a unicorn")
						.alignmentGuide(.trailing) {d in d[.leading]}
					Text("by sticking a plunger")
					Text("on your head.")
				}
				.background(Color.white)
				.frame(width: 300, height: 300)
				.background(Color.blue)
			}.padding(5)
		}
	}
}

struct OffsetVersusAlignment_Previews: PreviewProvider {
    static var previews: some View {
        OffsetVersusAlignment()
    }
}
