//
//  ContentView.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 5/25/21.
//

import SwiftUI

/*
 TO DO:
  1. Get the app to save user entries with UserDefaults and Codable
  2. Add form validation to AddSymptom
  3. Styling
 */

struct Symptom: Identifiable {
    var id = UUID()
    var name: String
    var date: String
}

class SymptomList: ObservableObject {
    @Published var list = [Symptom]()
}

struct AddSymptom: View {
    @ObservedObject var symptoms: SymptomList
    @State private var name = ""
    @State private var date = Date()
    
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
            .navigationBarItems(trailing: Button("Save") {
                let item = Symptom(name: self.name, date: self.formatDate)
                self.symptoms.list.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    var formatDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let entry = formatter.string(from: date)
        return entry
    }
}

struct ContentView: View {
    @ObservedObject var symptoms = SymptomList()
    @State private var addingSymptom = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(symptoms.list) { symptom in
                        VStack(alignment: .leading) {
                            Text(symptom.name)
                            Text("Start Date: \(symptom.date)")
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
    
    /*func addSymptom() {
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
     */
    
    /*
    
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
   */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
