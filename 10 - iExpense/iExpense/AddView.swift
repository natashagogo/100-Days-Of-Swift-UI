//
//  AddView.swift
//  iExpense
//
//  Created by Natasha Godwin on 5/27/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    static let types = ["Business", "Personal"]
    
    // We don't want to create a new instance of the Expenses class here.
    // Instead, we want this view to share the same instance as ContentView.
    // This code doesn't create a new object. It just says it exists.
    @ObservedObject var expenses: Expenses
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
           .navigationBarTitle("Add Expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Double(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.amountError(title: "Oops!", message: "Please enter a number for the amount.")
                }
                
                if let actualAmount = Int(self.amount) {
                    self.amountError(title: "Add Cents", message: "Please add the exact amount.")
                }
                
            })
        }.alert(isPresented: $showingError) {
            Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func amountError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
