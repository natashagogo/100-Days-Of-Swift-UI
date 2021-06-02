//
//  ContentView.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 5/25/21.
//

import SwiftUI

/*
 TO DO:
  1. Sort symptoms by start date
  2. Allow users to select and edit items in the list.
  3. Create a detail view for each symptom.
 */

struct ContentView: View {
    @ObservedObject var symptoms = SymptomList()
    @State private var addingSymptom = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(symptoms.list) { symptom in
                        VStack(alignment: .leading) {
                            Text("Start Date: \(symptom.date)")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            Text(symptom.name)
                        }
                    }
                    .onDelete(perform: delete)
                }

            }
            .navigationBarTitle("Symptom Tracker")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.addingSymptom = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $addingSymptom) {
            AddSymptom(symptoms: self.symptoms)
        }
    }
    
    func delete(at index: IndexSet) {
        symptoms.list.remove(atOffsets: index)
    }
    
    /* func importData() {
        // 1. Find the file
        if let dataURL = Bundle.main.url(forResource: "fake_symptoms", withExtension: "txt") {
            // 2. Convert the contents to a string
            if let contents = try? String(contentsOf: dataURL) {
                // 3. Split the string into an array of strings
                let list = contents.components(separatedBy: "\n")
                // 4. Add items to the symptom list
                for item in list {
                    let symptom = item.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                    symptoms.insert(symptom, at: 0)
                }
                return
            }
        }
        
        fatalError("Oops! There was an error uploading your data.")
    } */
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
