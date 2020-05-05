//
//  AddSymptom.swift
//  Symptom Tracker
//
//  Created by Natasha Godwin on 5/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct AddSymptom: View {
    @State private var name = ""
    @ObservedObject var symptoms: SymptomList
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                  .autocapitalization(.none)
            }
            .navigationBarTitle("Add Symptom")
            .navigationBarItems(trailing: Button("Save") {
                // TO DO -
                // Prevent users from entering the same symptom twice
                // Show an alert if they do. 
                let symptom = Symptom(name: self.name)
                self.symptoms.list.append(symptom)
                // Dismiss the view when the user taps "save"
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddSymptom_Previews: PreviewProvider {
    static var previews: some View {
        AddSymptom(symptoms: SymptomList())
    }
}
