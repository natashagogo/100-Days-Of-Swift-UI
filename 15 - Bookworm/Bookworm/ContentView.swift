//
//  ContentView.swift
//  Bookworm
//
//  Created by Natasha Godwin on 6/16/21.
//

import SwiftUI
import CoreData

/*
  What is Core Data?
  Core Data is Apple's framework for reading, writing, sorting, and filtering objects in a database.
 
  In more technical terms, Core Data is an object graph and persistence framework, meaning it is used to define objects and their properties and read and write them from permanent storage.

	Unlike other options for storing data, there's no limit to how much data you can store in Core Data. And there's advanced functionality you can lean on: sorting, filtering, form validation, lazy loading, undo and redo, etc.

  When you create a new entity in Core Data, it automatically generates a class that inherits from NSManagedObject. This class is responsible for loading objects from the persistent container and writing their changes back.

  All managed objects live in a managed object context, which is responsible for fetching objects and saving changes.


  How do you set up Core Data?
  
  Note: When you create a new project and check CoreData, XCode will do the first two steps in this list for you. But it's good to know all of the steps, in case you decide to add Core Data later.

  1. Create a persistent container to load and save data from device storage.
  2. Add it to the SwiftUI environment, so that all views can access it.
  3. Create the data model by adding an entity and attributes to the model file.
  4. Make a fetch request to retrieve data from Core Data, specifying how the data should be sorted and filtered and storing it in a property
  5. Create an @Environment property to store the managed object context, which is responsible for fetching objects and saving changes to them from Core Data.
  6. Create or generate objects, using the Core Data Class. Attach them to the managed object context, so the object knows where it should be stored. Assign values.
  7. Trigger a save with try? self.managedObjectContext.save()


 @Binding
 A property wrapper that references and updates a @State property declared elsewhere.

 Size Classes
 Size Classes are used to tell Swift how much space is available for a view. They are written in broad terms for flexibility. In SwiftUI, there are only two size classes for horizontal and vertical layouts: compact and regular.

AnyView
A type-erased wrapper that hides (or erases) the type of view that it contains. This is useful when you need to return different views or layouts, depending on the user's device or settings.

For performance reasons, you shouldn't use it often. SwiftUI works faster when it knows exactly what's in a view hierarchy.

@FetchRequest
A property wrapper that retrieves data from Core Data, using whatever managed object context is available in the environment. It takes two parameters: the entity you want to query and how the results should be sorted.


*/


struct ContentView: View {
	var body: some View {
		Text("Hello, World!")
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ContentView()
		}
    }
}
