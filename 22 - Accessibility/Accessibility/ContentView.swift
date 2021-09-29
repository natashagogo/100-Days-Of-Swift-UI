//
//  ContentView.swift
//  Accessibility
//
//  Created by Natasha Godwin on 9/29/21.
//

import SwiftUI


struct ContentView: View {
	let pictures = [
		"jezael-melgoza-7H77FWkK_x4",
		"jezael-melgoza-layMbSJ3YOE",
		"ozgu-ozden-OdOzmBQEvnc",
		"ryoji-iwata-n31JPLu8_Pw"
	]
	
	let labels = [
		"Tokyo Tower",
		"Crowded crosswalk",
		"Japanese architecture",
		"Crosswalk"
	]
	
	@State private var selectedPicture = Int.random(in: 0...3)
    var body: some View {
        Image(pictures[selectedPicture])
			.resizable()
			.scaledToFit()
			.onTapGesture {
				self.selectedPicture = Int.random(in: 0...3)
			}
			.accessibility(label: Text(labels[selectedPicture]))
			.accessibility(removeTraits: .isImage)
			.accessibility(addTraits: .isButton)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
