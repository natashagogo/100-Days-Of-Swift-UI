//
//  ContentView.swift
//  Bookworm
//
//  Created by Natasha Godwin on 6/16/21.
//


import SwiftUI
import CoreData

struct ContentView: View {
	@Environment(\.managedObjectContext) var viewContext
	@FetchRequest(entity: Book.entity(), sortDescriptors: [
		// Sort by author, then title
		NSSortDescriptor(keyPath: \Book.author, ascending: true),
	   NSSortDescriptor(keyPath: \Book.title, ascending: true),

	]) var books: FetchedResults<Book>
	@State private var addingBook = false
	var body: some View {
		NavigationView {
			List {
				 ForEach(books, id: \.self) { book in
					NavigationLink(destination: DetailView(book: book)) {
							EmojiRatingView(rating: book.rating)
								 .font(.largeTitle)

							VStack(alignment: .leading) {
								 Text(book.title ?? "Unknown Title")
									  .font(.headline)
								 Text(book.author ?? "Unknown Author")
									  .foregroundColor(.secondary)
							}
					  }
				 }
			}
			.navigationBarTitle("Bookworm")
			.navigationBarItems(trailing: Button("Add") {
				self.addingBook.toggle()
			})
		}
		.sheet(isPresented: $addingBook) {
			AddBookView()
				.environment(\.managedObjectContext, self.viewContext)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ContentView()
		}
    }
}
