//
//  ContentView.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/3/21.
//

import SwiftUI

/*
Encapsulation Principle
Classes and structs should provide methods for reading and writing data. External objects shouldn't read and write data directly.

Encapsulation
Encapsulation limits how much external objects can read and write values inside a class or a struct.

What should you use to notify SwiftUI that an observable object is about to change?
objectWillChange.send()

Does @EnvironmentObject work with structs?
No. It only works with classes.

What happens when an image is stretched larger than its original size?
SwiftUI smooths out the pixels in the image, which is called image interpolation. You can control that with the interpolation modifier. 




*/

struct ContentView: View {
	var prospects = Prospects()
    var body: some View {
		TabView {
			ProspectsView(filter: .none)
				.tabItem {
					Image(systemName: "person.3")
					Text("Everyone")
				}
			ProspectsView(filter: .contacted)
				.tabItem {
					Image(systemName: "checkmark.circle")
					Text("Contacted")
				}
			ProspectsView(filter: .uncontacted)
				.tabItem {
					Image(systemName: "questionmark.diamond")
					Text("Uncontacted")
				}
			MeView()
				.tabItem {
					Image(systemName: "person.crop.square")
					Text("Me")
				}
		 }
		.environmentObject(prospects)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
