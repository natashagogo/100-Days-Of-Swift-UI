//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 8/9/21.
//

import SwiftUI

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
		  FilteredList(filter: filter)
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
