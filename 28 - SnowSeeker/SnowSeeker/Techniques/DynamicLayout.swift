//
//  DynamicLayout.swift
//  SnowSeeker
//
//  Created by Natasha Godwin on 11/2/21.
//

import SwiftUI

struct Notes: View {
	var body: some View {
		Group {
			Rectangle()
				.fill(Color.blue)
			Rectangle()
				.fill(Color.purple)
			Rectangle()
				.fill(Color.pink)
		}
	}
}

struct DynamicLayout: View {
	@State private var layout = LayoutOptions.vertical
	@State private var showingLayoutOptions = false
	
	enum LayoutOptions {
		case vertical
		case horizontal
		case depth
	}

	 var body: some View {
		NavigationView {
			Group {
				switch(layout) {
				 case LayoutOptions.vertical:
					VStack(content: Notes.init)
				case LayoutOptions.horizontal:
				  HStack(content: Notes.init)
				case LayoutOptions.depth:
				  ZStack(content: Notes.init)
				}
			}
			.navigationTitle("Timeline")
			.navigationBarItems(trailing: Button("Layout") {
				self.showingLayoutOptions.toggle()
			})
			.actionSheet(isPresented: $showingLayoutOptions) {
				ActionSheet(title: Text("Change Layout"), message: Text("Choose a new layout"), buttons: [
					.default(Text("Vertical")) { layout = LayoutOptions.vertical},
					.default(Text("Horizontal")) { layout = LayoutOptions.horizontal},
					.default(Text("Stacked")) { layout = LayoutOptions.depth },
					.cancel()
				])
			}
		}
	}
}
struct DynamicLayout_Previews: PreviewProvider {
    static var previews: some View {
        DynamicLayout()
    }
}
