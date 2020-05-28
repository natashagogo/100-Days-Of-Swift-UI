//
//  ContentView.swift
//  iExpense
//
//  Created by Natasha Godwin on 5/26/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

// TO DO
// 1. Put the totals for each category at the top.
// 2. Add a DatePicker to AddView, with the default set to the current date.
// 4. Add filters for each category.
// 5. Add charts.
// 6. Let users create their own tags for each item.

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    var body: some View {
        NavigationView {
            List {
                // The items in this ForEach don't need an id.
                // That's because each expense item already has a unique id. See: ExpenseItem.swift
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text("$\(item.amount, specifier: "%.2f")")
                            .foregroundColor(item.amount > 100 ? .red : .black)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    self.showingAddExpense = true
            }) {
                Image(systemName: "plus")
            }
          )
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: self.expenses)
        }
    }
    
    func removeItems(at locations: IndexSet) {
        expenses.items.remove(atOffsets: locations)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
