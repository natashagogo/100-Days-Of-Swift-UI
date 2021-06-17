//
//  ContentView.swift
//  Bookworm
//
//  Created by Natasha Godwin on 6/16/21.
//

/*
 
 Sorting Fetch Requests
 
 NSSortDescriptor(keyPath: \Entity.attribute, ascending: true)
 
 Note that you can specify more than one sort descriptor. They will be applied in the order they are added.
 
 How to delete items from Core Data
 
 Write a function that ...
    Locates the requested object in the fetch request
    Deletes it from the viewContext
    Saves changes to the viewContext
  
 Attach .onDelete(perform: ) to ForEach and call the function
 
 How to create a custom alert button
 
 You can add multiple buttons to an alert by adding the primaryButton: and secondaryButton: parameters to alert.
 
 Alert(title: Text("Delete book"), message: Text("Are you sure you want to delete this?"), primaryButton: .destructive(Text("Delete")) {
     self.deleteBook()
 }, secondaryButton: .cancel())
 
 How to pop to the main view when a detail view item has been deleted
 
 1. Add an @Environment property that stores the managed object context, so the item can be deleted
 2. Add an @Environment property that stores the presentation mode to return to the parent view upon deletion
 3. Add a @State property that stores whether an alert is being shown
 4. Write a function that deletes the book from the viewContext, makes the change permanent by saving the viewContext, and dismisses the current presentation mode
 5. Add an alert that monitors the @State property for changes
 6. Add a navigation button that triggers an alert
 
 
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
                            Text(book.author ?? "Unknown Author")
                                .foregroundColor(.secondary)
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
