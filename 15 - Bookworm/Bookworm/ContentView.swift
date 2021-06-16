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
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.id) { student in
                    Text(student.name ?? "Unknown")
                }
            }
            Button("Add") {
                let firstNames = ["Meredith", "Cristina", "Alex", "George", "Izzy"]
                let lastNames = ["Gray", "Yang", "Karev", "O'Malley", "Stevens"]
                
                let randomFirstName = firstNames.randomElement()!
                let randomLastName = lastNames.randomElement()!
                
                // Create a new Student object and attach it to the managed object context, so it knows where it should be stored.
                let student = Student(context: self.viewContext)
                student.id = UUID()
                student.name = "\(randomFirstName) \(randomLastName)"
                
                // Ask the managed object context to save changes
                try? self.viewContext.save()
            }
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
