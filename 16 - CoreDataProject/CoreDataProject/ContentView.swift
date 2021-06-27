//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 6/19/21.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext

    var body: some View {
        FilteredListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
