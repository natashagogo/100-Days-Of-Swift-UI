//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 8/9/21.
//

import SwiftUI
import CoreData

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
				Text(note.formattedDate)
					.font(.headline)
					.fontWeight(.bold)
				Text(note.wrappedText)
				Text(note.wrappedCategory)
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
			 note1.date = Date()
				
			 let note2 = Note(context: self.viewContext)
			 note2.text = "Decided to apply to medical school."
			 note2.category = "decisions"
			 note2.date = Date().addingTimeInterval(-86400)
				
			 let note3 = Note(context: self.viewContext)
			 note3.text = "Deleted my Instagram account."
			 note3.category = "decisions"
			 note2.date = Date().addingTimeInterval(-172800)
				
			 let note4 = Note(context: self.viewContext)
			 note4.text = "'Deciding where to work, and what to work on, is a matter of deciding whose vision you want to buy into.' - Nadia Eghbal"
			 note4.category = "quotes"
			 note2.date = Date().addingTimeInterval(-300000)
				
			try? self.viewContext.save()

			}
	    }
    }
}


struct FilteredList: View {
	var fetchRequest: FetchRequest<Note>
	var predicate: String
	var notes: FetchedResults<Note> {
		fetchRequest.wrappedValue
	}
	
	// A custom initializer that accepts a filter as a string and uses it to set the fetchRequest property
	init(filter: String) {
		predicate = "category"
		fetchRequest = FetchRequest<Note>(
			entity: Note.entity(),
			sortDescriptors: [
				NSSortDescriptor(keyPath: \Note.date, ascending: true)
			],
			predicate: NSPredicate(format: "\(predicate)== %@", filter)
		)
	}
	
    var body: some View {
		VStack {
			List(notes, id: \.self) { note in
				VStack(alignment: .leading, spacing: 10) {
					Text(note.formattedDate)
						.font(.headline)
						.fontWeight(.bold)
					Text(note.wrappedText)
					Text(note.wrappedCategory)
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
		  fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K == %@", filterKey, filterValue))
		  self.content = content
	 }
}


