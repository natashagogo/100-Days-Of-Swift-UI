//
//  AddBookView.swift
//  Bookworm
//
//  Created by Natasha Godwin on 6/16/21.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = [
        "Fiction",
        "Non-Fiction"
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Picker("Rating", selection: $rating) {
                        ForEach(0..<6) {
                           Text("\($0)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextEditor(text: $review)
                }
                Section{
                    Button("Add") {
                        let newBook = Book(context: self.viewContext)
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        newBook.genre = self.genre
                        newBook.review = self.review

                        try? self.viewContext.save()
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
