//
//  AddEntry.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 6/21/21.
//

import SwiftUI

struct AddEntry: View {
    let symptom: Symptom
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    @FetchRequest(entity: Entry.entity(), sortDescriptors: []) var entries: FetchedResults<Symptom>
    
    @State private var date = Date()
    @State private var score = 0
    
    let scores = [
        "mild",
        "moderate",
        "severe"
    ]
    
    var body: some View {
        NavigationView {
            Form {
              DatePicker("Date", selection: $date)
                Picker("Score", selection: $score) {
                    ForEach(0..<scores.count) {
                        Text("\(scores[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .navigationBarTitle("\(symptom.unwrappedName)")
            .navigationBarItems(trailing: Button("Save") {
                let newEntry = Entry(context: viewContext)
                newEntry.date = self.date
                newEntry.score = scores[self.score]
                newEntry.symptom = self.symptom
                
                try? viewContext.save()
                
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
