//
//  ContentView.swift
//  Bookworm
//
//  Created by Natasha Godwin on 6/16/21.
//

/*

@Environment
A property wrapper that allows you to read values from the environment.

.environment()
A modifier that allows you to write values in the environment. Takes two parameters: a key to write to and the value that needs to be sent in.

Use Cases:
- Passing a managed object context from a view's environment to a sheet, so new items can be added
*/

import SwiftUI
import CoreData

struct ContentView: View {
	@Environment(\.managedObjectContext) var viewContext
	@FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
	@State private var addingBook = false
	var body: some View {
		NavigationView {
			List {
				 ForEach(books, id: \.self) { book in
					  NavigationLink(destination: Text(book.title ?? "Unknown Title")) {
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
