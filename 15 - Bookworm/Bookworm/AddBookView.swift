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
    @State private var genre = "Non-Fiction"
    @State private var review = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    let genres = [
        "Fiction",
        "Non-Fiction"
    ]
    
    // Create one instance of DateFormatter
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()

    // Use that instance to format reading dates
    var datesRead: String  {
        let date1 = dateFormatter.string(from: startDate)
        let date2 = dateFormatter.string(from: endDate)
        return "\(date1)—\(date2)"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Basics")){
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Dates Read")) {
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                    DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                }
                Section(header: Text("Rating")){
                    RatingView(rating: $rating)
                }
                Section(header: Text("Review")) {
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
                        newBook.startDate = self.startDate
                        newBook.endDate = self.endDate
                        newBook.datesRead = self.datesRead

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
