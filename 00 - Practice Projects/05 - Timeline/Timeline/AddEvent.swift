//
//  AddEvent.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/3/21.
//

import SwiftUI

struct AddEvent: View {
    @ObservedObject var events: EventList
    @State private var date = Date()
    @State private var entry = ""
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var formatDate: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        let entry = formatter.string(from: date)
        return entry
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
              DatePicker("Date", selection: $date)
                .labelsHidden()
              TextEditor(text: $entry)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 5.0))
            }
            .padding()
            .background(Color(red: 225/255, green: 227/255, blue: 230/255))
            .navigationBarTitle("\(self.formatDate)")
            .navigationBarItems(trailing: Button("Save") {
                self.presentationMode.wrappedValue.dismiss()
                self.addEvent(text: self.entry, date: self.formatDate)
            })
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func addEvent(text: String, date: String) {
        let new = Event(text: text, date: date)
        
        guard new.text.count > 0 else {
            showError(title: "Oops!", message: "You didn't write anything.")
            return
        }
        events.list.append(new)
    }
    
    func showError(title: String, message: String) {
        showingAlert = true
        alertTitle = title
        alertMessage = message
    }
}


struct AddEvent_Previews: PreviewProvider {
    static var previews: some View {
        AddEvent(events: EventList())
    }
}
