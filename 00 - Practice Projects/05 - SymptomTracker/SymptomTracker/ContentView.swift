//
//  ContentView.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 5/25/21.
//

import SwiftUI

/*
 TO DO:
  Add start dates to each symptom
 */

struct Symptom {
    var id = UUID()
    var name: String
    var start: Date
}

struct ContentView: View {
    @State private var symptoms = [String]()
    @State private var symptom = ""
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Add new symptom", text: $symptom, onCommit: addSymptom)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                List {
                    ForEach(symptoms, id: \.self) {
                        Text($0)
                    }
                    .onDelete(perform: delete)
                }

            }
            .navigationBarTitle("Symptom Tracker")
            .navigationBarItems(trailing: Button(action: importData) {
                Text("Import")
            })
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func importData() {
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
    }
    
    func addSymptom() {
        let newSymptom = symptom.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard symptom.count > 0 else {
            return
        }
        
        guard checkSpelling(word: symptom) else {
            showAlert(title: "Oops!", message: "Check your spelling.")
            return
        }
        
        guard preventDuplicates(name: symptom) else {
            showAlert(title: "Already added", message: "You've already added this symptom")
            return
        }
        
        symptoms.insert(newSymptom, at: 0)
        symptom = ""
    }
    
    func delete(at index: IndexSet) {
        symptoms.remove(atOffsets: index)
    }
    
    func preventDuplicates(name: String) -> Bool {
        !symptoms.contains(name)
    }
    
    func checkSpelling(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let errorFound = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return errorFound.location == NSNotFound
    }
    
    func showAlert(title: String, message: String) {
        showingAlert = true
        alertTitle = title
        alertMessage = message
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
