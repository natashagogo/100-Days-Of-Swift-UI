//
//  ContentView.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/3/21.
//

import SwiftUI

/*

TO DO:
1. Change how data is saved. Used JSON and the documents directory to save and load user data.
2. Let users delete contacts.

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
