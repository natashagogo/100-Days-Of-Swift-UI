//
//  ContentView.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 5/25/21.
//

import SwiftUI
import CoreData

/*
 TO DO:
 
 1. Map the user flow.
 2. Add filter by date to DetailView.
 3. Add a chart to DetailView
 */

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Symptom.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Symptom.startDate, ascending: true)
    ]) var symptoms: FetchedResults<Symptom>
    @State private var addingNewSymptom = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(symptoms, id: \.self) { symptom in
                    NavigationLink(destination: DetailView(symptom: symptom)) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(symptom.formattedDate)
                            Text(symptom.unwrappedName)
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle("Symptoms")
            .navigationBarItems(leading: EditButton(), trailing: Button("Add") {
                self.addingNewSymptom.toggle()
            })
        }
        .sheet(isPresented: $addingNewSymptom) {
            AddSymptom()
                .environment(\.managedObjectContext, self.viewContext)
        }
    }
    
    func delete (at locations: IndexSet) {
        for location in locations {
            let symptom = symptoms[location]
            viewContext.delete(symptom)
        }
        try? viewContext.save()
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
