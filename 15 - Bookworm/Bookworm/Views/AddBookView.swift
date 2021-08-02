//
//  AddBookView.swift
//  Bookworm
//
//  Created by Natasha Godwin on 8/2/21.
//

import SwiftUI

struct AddBookView: View {
	@Environment(\.managedObjectContext) var viewContext
	@Environment(\.presentationMode) var presentationMode
	@State private var title = ""
	@State private var author = ""
	@State private var genre = ""
	@State private var rating = 3
	@State private var review = ""
	
	let genres = ["Fiction", "Non-Fiction", "Graphic Novel"]
	
    var body: some View {
		NavigationView {
			Form {
				Section(header: Text("Basics")) {
					TextField("Title", text: $title)
					TextField("Author", text: $author)
					Picker("Genre", selection: $genre) {
						ForEach(genres, id: \.self) {
							Text($0)
						}
					}
					.pickerStyle(SegmentedPickerStyle())
				}
				Section(header: Text("Review")) {
					RatingView(rating: $rating)
					TextEditor(text: $review)
				}
			}
			.navigationBarTitle(title.isEmpty ? "New Book": "\(title)")
			.navigationBarItems(trailing: Button("Save") {
				let newBook = Book(context: self.viewContext)
				newBook.title = self.title
				newBook.author = self.author
				newBook.genre = self.genre
				newBook.rating = Int16(self.rating)
				newBook.review = self.review
				
				try? self.viewContext.save() // save changes
				
				self.presentationMode.wrappedValue.dismiss()
				
			})
			.disabled(title.isEmpty || author.isEmpty)
		}
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
