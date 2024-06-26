//
//  DetailView.swift
//  Bookworm
//
//  Created by Natasha Godwin on 8/4/21.
//

import SwiftUI
import CoreData

struct DetailView: View {
	@Environment(\.managedObjectContext) var viewContext
	@Environment(\.presentationMode) var presentationMode
	@State private var showingAlert = false
	let book: Book
    var body: some View {
		GeometryReader { geometry in
			VStack {
				ZStack(alignment: .bottomTrailing) {
					Image(book.genre ?? "Non-Fiction")
						.resizable()
						.scaledToFit()
						.frame(maxWidth: geometry.size.width)
					Text(book.genre?.uppercased() ?? "NON-FICTION")
						.font(.caption)
						.fontWeight(.black)
						.padding(8)
						.foregroundColor(.white)
						.background(Color.black.opacity(0.75))
						.clipShape(Capsule())
						.offset(x: -5, y: -5)
				}
				Group {
					Text(book.author ?? "Unknown Author")
						.font(.title)
						.foregroundColor(.secondary)
					VStack(alignment:.leading) {
						Text("Started: \(book.startDate?.formatted() ?? "No Date Added")")
						Text("Finished: \(book.endDate?.formatted() ?? "No Date Added")")
					}.padding()
					RatingView(rating: .constant(Int(book.rating)))
						.font(.largeTitle)
					Text(book.review ?? "No review")
						.padding()
				}
				Spacer()
			}
		}
		.navigationBarTitle(Text(book.title ?? "Unknown"), displayMode: .inline)
		.navigationBarItems(trailing: Button(action: {
			self.showingAlert = true
		}) {
			Image(systemName: "trash")
		})
		.alert(isPresented: $showingAlert) {
			Alert(title: Text("Delete Book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")) {
				self.deleteBook()
			}, secondaryButton: .cancel())
		}
    }
	
	func deleteBook() {
		viewContext.delete(book)
		presentationMode.wrappedValue.dismiss()
	}
}

struct DetailView_Previews: PreviewProvider {
	static let viewContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
		let book = Book(context: viewContext)
		book.title = "Test"
		book.author = "Unknown Author"
		book.genre = "Non-Fiction"
		book.rating = 3
		book.review = "This was great!"
		
		return NavigationView {
			DetailView(book: book)
		}
    }
}
