//
//  ContentView.swift
//  iExpense
//
//  Created by Natasha Godwin on 5/1/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

// TO DO: 
// 1. Add categories. Allow users to add categories or tags to expenses
// 2. Add dates. Let users select the date for the expense or use the current date as a default.
// 3. Allow users to tap on a row to edit entries, in case they misspell something.

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    var body: some View {
        NavigationView {
            // This list is created with ForEach, so users can delete items
            // Without ForEach, you can't use the .onDelete() modifier
            List {
                // This ForEach doesn't need an id because each ExpenseItem inside the Expenses class already has a unique id.
                ForEach(expenses.items) { item in
                    HStack {
                       VStack(alignment: .leading) {
                           Text(item.name)
                               .font(.headline)
                           Text(item.type)
                       }

                       Spacer()
                       Text("$\(item.amount, specifier: "%.2f")")
                   }
                }
                .onDelete(perform: removeItems) // deletes items
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showingAddExpense = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: self.expenses)
        }
    }
    func removeItems(location: IndexSet) {
        expenses.items.remove(atOffsets: location)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
