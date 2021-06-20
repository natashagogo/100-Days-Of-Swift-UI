//
//  FilteredListView.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 6/20/21.
//

import SwiftUI

struct FilteredListView: View {
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

struct FilteredListView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredListView()
    }
}
