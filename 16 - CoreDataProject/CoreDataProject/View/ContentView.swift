//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 8/6/21.
//


import SwiftUI
import CoreData

struct ContentView: View {
 var body: some View {
		NavigationView {
			List {
				Section(header: Text("Getting Started")) {
					NavigationLink(destination: FavoriteMovies()) {
						Text("Basic Example")
					}
					NavigationLink(destination: Constraints()) {
						Text("Adding Constraints")
					}
					NavigationLink(destination: Notes()) {
						Text("Filtering results")
					}
				}
			}
			.navigationBarTitle("Core Data 101")
			.listStyle(InsetGroupedListStyle())
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
