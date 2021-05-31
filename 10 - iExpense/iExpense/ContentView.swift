//
//  ContentView.swift
//  iExpense
//
//  Created by Natasha Godwin on 5/31/21.
//

import SwiftUI


struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    var body: some View {
        NavigationView {
            List {
                ForEach(numbers, id: \.self) {
                    Text("\($0)")
                }
                .onDelete(perform: removeItem)
            }
            .navigationBarTitle("Numbers")
            .navigationBarItems(leading: EditButton(), trailing: Button("Add") {
                self.numbers.append(self.currentNumber)
                self.currentNumber += 1
            } )

        }
    }
    
    func removeItem(at location: IndexSet) {
        numbers.remove(atOffsets: location)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
