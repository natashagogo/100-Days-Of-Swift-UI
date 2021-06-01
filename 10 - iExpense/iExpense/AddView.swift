//
//  AddView.swift
//  iExpense
//
//  Created by Natasha Godwin on 6/1/21.
//

import SwiftUI

struct AddView: View {
    /*
     The code in the first line below ensures data is shared across views. It's not a new instance of the Expenses class. See ContentView.swift for the actual class instance.
     */
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @State private var showingError = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    
    static let types = ["Business", "Personal"]
    
    // Store a reference to the view's presentation mode, so this view can be dismissed
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
            }
            .navigationBarTitle("Add")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Double(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.showingError = true
                    errorTitle = "Oops!"
                    errorMessage = "Please enter a number."
                }
            })
        }
        .alert(isPresented: $showingError) {
            Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
