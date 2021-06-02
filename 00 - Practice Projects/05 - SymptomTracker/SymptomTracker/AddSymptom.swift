//
//  AddSymptom.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 6/2/21.
//

import SwiftUI

struct AddSymptom: View {
    @ObservedObject var symptoms: SymptomList
    @State private var name = ""
    @State private var date = Date()
    
    @State private var showingAlert = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Symptom")) {
                    TextField("Add new symptom", text: $name)
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Section(header: Text("Start Date")) {
                    DatePicker("Start Date", selection: $date, displayedComponents: .date)
                        .labelsHidden()
                }
            }
            .navigationBarTitle("New Symptom")
            .navigationBarItems(trailing: Button("Save") {
                self.addSymptom(name: name, date: formatDate)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    var formatDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let entry = formatter.string(from: date)
        return entry
    }
    
    func addSymptom(name: String, date: String) {
        let symptomName = name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        let newSymptom = Symptom(name: symptomName, date: formatDate)
        
        guard isNew(symptom: newSymptom) else {
            showAlert(title: "Already added", message: "You've already added \(newSymptom.name) to your list")
            return
        }
        
        guard checkSpelling(word: newSymptom.name) else {
            showAlert(title: "Oops!", message: "We don't recognize that symptom. Check your spelling.")
            return
        }
        
        self.symptoms.list.append(newSymptom)
   }
    
    func isNew(symptom: Symptom) -> Bool {
        // This will only check the name property.
        // See the ==function in Symptom.swift
        !symptoms.list.contains(symptom)
    }
   
   func checkSpelling(word: String) -> Bool {
       let checker = UITextChecker()
       let range = NSRange(location: 0, length: word.utf16.count)
       let errorFound = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
       
       return errorFound.location == NSNotFound
   }
   
   func showAlert(title: String, message: String) {
       showingAlert = true
       errorTitle = title
       errorMessage = message
   }
    
    
}

struct AddSymptom_Previews: PreviewProvider {
    static var previews: some View {
        AddSymptom(symptoms: SymptomList())
    }
}
