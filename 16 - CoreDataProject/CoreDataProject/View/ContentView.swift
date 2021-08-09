//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 8/6/21.
//

/*

 What is the hasChanges property?
 In Core Data, every managed object receives a hasChanges property, which checks whether there are any unsaved changes.

Why shouldn't you call .save() directly in Core Data?
Because it has a higher performance impact. Instead, use the hasChanges property to check for changes first, like so:

if self.viewContext.hasChanges {
  try? self.viewContext.save()
}

What are constraints?
In Core Data, constraints are used to ensure that an attribute in an entity is always unique.
When you add a constraint, Core Data resolves duplicates, so that only one piece of data gets written. If the data that's being added clashes with existing data, you can choose how it handle merging it.

For example, you can make sure each user only has one email address. 

*/

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
