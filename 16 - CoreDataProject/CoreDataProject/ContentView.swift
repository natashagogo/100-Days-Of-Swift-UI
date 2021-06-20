//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 6/19/21.
//

import SwiftUI
import CoreData

/*
 
 NSPredicate
 
 %@
 
 Operators commonly used with predicates
  IN - Checks whether it matches items in an array
 BEGINSWITH - Checks whether a string begins with a certain letter
 CONTAINS - Checks whether a string contains certain characters
 NOT - Checks the inverse of a predicate
 
 */


struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @State private var lastNameFilter = "A"

    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 50) {
                    Button("Show A") {
                        self.lastNameFilter = "A"
                    }
                    Button("Show S") {
                        self.lastNameFilter = "S"
                    }
                }
                FilteredList(filter: lastNameFilter)
            }
                .navigationBarTitle("Singers")
                .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
