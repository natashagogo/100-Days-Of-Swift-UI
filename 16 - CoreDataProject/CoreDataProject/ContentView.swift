//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 6/19/21.
//

import SwiftUI
import CoreData

/*
 Why does \.self work on ForEach?
 
 When you use \.self for the identifier, Swift computes the hash value of the object.
 
 A hash value is a way of representing complex data in fixed-size values.
 
 Hashable
 A protocol that generates hash values for a given struct, making it possible to use \.self as an identifier
 
 Note that Core Data classes automatically conform to Hashable.
 
 Creating NSManagedObject subclasses
 
 
 */

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
       Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
