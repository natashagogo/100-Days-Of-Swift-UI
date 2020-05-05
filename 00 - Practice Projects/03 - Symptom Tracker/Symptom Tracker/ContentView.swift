//
//  ContentView.swift
//  Symptom Tracker
//
//  Created by Natasha Godwin on 4/2/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

// TO DO
// Create ...
// 1. a struct called Symptom that contains the data for each symptom.
// 2. a class called SymptomList that contains an array of Symptom objects.
// 3. a editable list in ContentView that contains an instance of that class.
// 4. an AddSymptom View that allows users to enter new symptoms when they press the plus button.


struct ContentView: View {
    @ObservedObject private var symptoms = SymptomList()
    @State private var showingAddSymptom = false
    var body: some View {
        NavigationView {
            List {
                ForEach(symptoms.list) { symptom in
                    Text(symptom.name)
                }
                .onDelete(perform: removeItems)
                
            }
            .navigationBarTitle("Symptom Tracker")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showingAddSymptom = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showingAddSymptom) {
            AddSymptom(symptoms: self.symptoms)
        }
    }
    
    func removeItems(location: IndexSet) {
        self.symptoms.list.remove(atOffsets: location)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
