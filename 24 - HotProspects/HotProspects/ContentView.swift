//
//  ContentView.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/3/21.
//

import SwiftUI

/*
"The most difficult thing is the decision to act, the rest is merely tenacity." - Amelia Earhart

map()
A method that iterates over elements in a sequence, transforms each using a closure, and returns the result in a new array.

filter()
A method that iterates over elements in a sequence, checks whether each meets a certain condition, and returns those that do in a new array

functional programming

What does the .environmentObject modifier do?
It posts an ObservableObject into the SwiftUI environment, so all child views can access it. Note that you will have to add this directly to views inside a sheet.

What does @EnvironmentObject do?
This property wrapper finds an object, attaches it to a property, and keeps it up to date over time.


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
