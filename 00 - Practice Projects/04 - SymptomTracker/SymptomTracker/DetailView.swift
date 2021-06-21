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

    @State private var addingNewEntry = false
    
    var body: some View {
        List {
            ForEach(symptom.entryArray, id:\.self) { entry in
                VStack(alignment: .leading) {
                    Text(entry.formattedDate)
                    Text(entry.unwrappedScore)
                }
            }
            .onDelete(perform: delete)
        }
        .navigationBarTitle("\(symptom.unwrappedName)", displayMode: .inline)
        .navigationBarItems(trailing: Button("Add") {
            self.addingNewEntry.toggle()
        })
        .sheet(isPresented: $addingNewEntry) {
            AddEntry(symptom: self.symptom)
                .environment(\.managedObjectContext, self.viewContext)
        }
    }
    
    func delete(at locations: IndexSet) {
        for location in locations {
            let entry = symptom.entryArray[location]
            viewContext.delete(entry)
        }
        try? viewContext.save()
    }
}
