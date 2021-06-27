//
//  FilteredListView.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 6/20/21.
//

import SwiftUI

enum Genre: String {
    case pop = "Pop"
    case alternative = "Alternative"
    case electronic = "Electronic"
}

let pop = Genre.pop.rawValue
let alternative = Genre.alternative.rawValue
let electronic = Genre.electronic.rawValue


struct FilteredListView: View {
    @Environment(\.managedObjectContext) var viewContext
    @State private var genreFilter = pop

    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 50) {
                    Button(pop) {
                        self.genreFilter = pop
                    }
                    Button(alternative) {
                        self.genreFilter = alternative
                    }
                    Button(electronic) {
                        self.genreFilter = electronic
                    }
                }
                FilteredList(filter: genreFilter)
            }
                .navigationBarTitle("Albums")
                .navigationBarItems(leading: EditButton())
        }
    }
}

struct FilteredListView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredListView()
    }
}
