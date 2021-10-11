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
