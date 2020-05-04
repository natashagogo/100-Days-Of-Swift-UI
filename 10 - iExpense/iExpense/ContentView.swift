//
//  ContentView.swift
//  iExpense
//
//  Created by Natasha Godwin on 5/1/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

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
                       Text("$\(item.amount)")
                   }
                }
                .onDelete(perform: removeItems) // deletes items
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing: Button(action: {
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
