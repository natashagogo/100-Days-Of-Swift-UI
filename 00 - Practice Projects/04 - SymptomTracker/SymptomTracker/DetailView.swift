//
//  DetailView.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 6/21/21.
//

import SwiftUI

struct DetailView: View {
    let symptom: Symptom

    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Entry.entity(), sortDescriptors: []) var entries: FetchedResults<Symptom>

    
    var body: some View {
        NavigationView {
            List {
                ForEach(symptom.entryArray, id:\.self) { entry in
                    VStack(alignment: .leading) {
                        Text(entry.formattedDate)
                        Text(entry.unwrappedScore)
                    }
                }
                .onDelete(perform: delete)
            }
        }
        .navigationBarTitle("\(symptom.unwrappedName)", displayMode: .inline)
        .navigationBarItems(trailing: Button("Add") {
            let example = Entry(context: self.viewContext)
            example.date = Date()
            example.score = "Severe"
            example.symptom = self.symptom
            
            try? viewContext.save()
        })
    }
    
    func delete(at locations: IndexSet) {
        for location in locations {
            let entry = symptom.entryArray[location]
            viewContext.delete(entry)
        }
        try? viewContext.save()
    }
}
