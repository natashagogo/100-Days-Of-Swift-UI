//
//  AddSymptom.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 6/20/21.
//

import SwiftUI

struct AddSymptom: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var startDate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("What's going on?", text: $name)
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Section(header: Text("Start Date")) {
                    DatePicker("When did it start?", selection: $startDate, displayedComponents: .date)
                        .labelsHidden()
                }
            }
            .navigationBarTitle("New Symptom")
            .navigationBarItems(trailing: Button("Save") {
                let newSymptom = Symptom(context: self.viewContext)
                newSymptom.name = self.name
                newSymptom.startDate = self.startDate
                try? self.viewContext.save()
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddSymptom_Previews: PreviewProvider {
    static var previews: some View {
        AddSymptom()
    }
}
