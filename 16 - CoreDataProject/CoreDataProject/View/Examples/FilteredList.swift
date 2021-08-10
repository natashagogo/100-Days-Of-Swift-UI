//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 8/9/21.
//

import SwiftUI
import CoreData

/*

Imagine you're creating a filtered list with generics and Core Data.

What three things do you need to do?

Will this code work: NSPredicate(format: "%@ BEGINSWITH %@", keyName, filter)?

No. When you use %@, Core Data automatically inserts quote marks around the content.
Attributes shouldn't have quotes around them.

You should write this instead:
NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue)

What does %K do?
%K is a special symbol in NSPredicate that can be used to replace attribute names.
Unlike %@, %K will insert the provided value without putting quote marks around it.

This is useful when creating generic filters.

Example:
NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue)


Lingering Questions
What does @ViewBuilder do?
What does @escaping do?



*/

struct Notes: View {
	@Environment(\.managedObjectContext) var viewContext
	@State private var filter = ""
	var body: some View {
	  VStack {
		  HStack {
			  Button("decisions") {
				  filter = "decisions"
			  }
			  Button("quotes") {
				  filter = "quotes"
			  }
		  }
		  //FilteredList(filter: filter)
		GenericFilteredList(filterKey: "category", filterValue: filter) { (note: Note) in
			VStack(alignment: .leading, spacing: 10) {
				Text(note.text ?? "")
					.font(.headline)
				Text(note.category ?? "uncategorized")
					.frame(width: 100, height: 20)
					.background(Color.blue)
					.foregroundColor(.white)
					.clipShape(RoundedRectangle(cornerRadius: 25.0))
			}
		}
		  Button("Add") {
			 let note1 = Note(context: self.viewContext)
			 note1.text = "'The one who does the work does the learning' - Terry Doyle"
			 note1.category = "quotes"
				
			 let note2 = Note(context: self.viewContext)
			 note2.text = "Decided to apply to medical school."
			 note2.category = "decisions"
				
			 let note3 = Note(context: self.viewContext)
			 note3.text = "Deleted my Instagram account."
			 note3.category = "decisions"
				
			 let note4 = Note(context: self.viewContext)
			 note4.text = "'Deciding where to work, and what to work on, is a matter of deciding whose vision you want to buy into.' - Nadia Eghbal"
			 note4.category = "quotes"
				
			try? self.viewContext.save()

			}
	    }
    }
}

struct FilteredList: View {
	var fetchRequest: FetchRequest<Note>
	var notes: FetchedResults<Note> {
		fetchRequest.wrappedValue
	}
	
	// A custom initializer that accepts a filter as a string and uses it to set the fetchRequest property
	init(filter: String) {
		fetchRequest = FetchRequest<Note>(entity: Note.entity(), sortDescriptors: [], predicate: NSPredicate(format: "category == %@", filter))
	}
	
    var body: some View {
		VStack {
			List(notes, id: \.self) { note in
				VStack(alignment: .leading, spacing: 10) {
					Text(note.text ?? "")
						.font(.headline)
					Text(note.category ?? "uncategorized")
						.frame(width: 100, height: 20)
						.background(Color.blue)
						.foregroundColor(.white)
						.clipShape(RoundedRectangle(cornerRadius: 25.0))
				}
			}
		}
		.navigationBarTitle("Notes", displayMode: .inline)
		
    }
 }

struct GenericFilteredList<T: NSManagedObject, Content: View>: View {
	 var fetchRequest: FetchRequest<T> // Whatever is passed in must be an NSManagedObject (Core Data subclass)
	 var results: FetchedResults<T> { fetchRequest.wrappedValue }

	 let content: (T) -> Content // Let the containing view decide what the content is

	 var body: some View {
		  List(results, id: \.self) { result in
				self.content(result)
		  }
	 }

	 init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
		  fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
		  self.content = content
	 }
}


