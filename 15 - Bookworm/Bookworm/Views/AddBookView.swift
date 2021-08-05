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
	@State private var genre = "Fiction"
	
	@State private var startDate = Date()
	@State private var endDate = Date().addingTimeInterval(86400)
	
	@State private var rating = 3
	@State private var review = ""
	
	let genres = ["Fiction", "Non-Fiction", "Graphic Novel"]
	
	@State private var showingAlert = false
	@State private var alertTitle = ""
	@State private var alertMessage = ""
	
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
					}.pickerStyle(SegmentedPickerStyle())
				}
				Section(header: Text("Dates Read")) {
					DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
					DatePicker("End Date", selection: $endDate, displayedComponents: .date)
				}
				Section(header: Text("Review")) {
					RatingView(rating: $rating)
					ZStack(alignment: .topLeading) {
						if review.isEmpty {
							Text("Write a review")
								.padding(.top, 10)
								.foregroundColor(.secondary)
						}
						TextEditor(text: $review)
					}
				}
			}
			.navigationBarTitle(title.isEmpty ? "New Book": "\(title)")
			.navigationBarItems(trailing: Button("Save") {
				let newBook = Book(context: self.viewContext)
				self.validateForm(book: newBook)
				
				if showingAlert == false {
					newBook.title = self.title
					newBook.author = self.author
					newBook.genre = self.genre
					newBook.rating = Int16(self.rating)
					newBook.review = self.review
					
					try? self.viewContext.save() // save changes
					
					self.presentationMode.wrappedValue.dismiss()
				}
			})
		}
		.alert(isPresented: $showingAlert) {
			Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
		}
	 }
	
	func validateForm(book: Book) {
		guard !title.isEmpty || !author.isEmpty else {
			showingAlert = true
			alertTitle = "Missing Info"
			alertMessage = "Please add a title and author."
			return
		}
	}
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
