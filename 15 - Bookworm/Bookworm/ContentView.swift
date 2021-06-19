//
//  ContentView.swift
//  Bookworm
//
//  Created by Natasha Godwin on 6/16/21.
//

/*
 Questions
 
 How would you add filters, so users can choose which sorting methods they prefer?
 */

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: true),
    ]) var books: FetchedResults<Book>
    
    @State private var addingNewBook = false
    
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
                                .foregroundColor(book.rating == 1 ? Color.red: Color.black)
                            Text(book.author ?? "Unknown Author")
                                .foregroundColor(.secondary)
                            Text(book.datesRead ?? "no dates added")
                                .font(.caption)
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
               .navigationBarTitle("Bookworm")
               .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                   self.addingNewBook.toggle()
               }) {
                   Image(systemName: "plus")
               })
               .sheet(isPresented: $addingNewBook) {
                   AddBookView().environment(\.managedObjectContext, self.viewContext)
               }
          }
    }
    
    func deleteBooks(at locations: IndexSet) {
        for location in locations {
            // Find the book in the fetch request
            let book = books[location]
            // Delete it from the viewContext
            viewContext.delete(book)
        }
        // Save the context
        try? viewContext.save()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
