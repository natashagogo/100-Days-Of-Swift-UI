//
//  ContentView.swift
//  iDine
//
//  Created by Natasha Godwin on 6/22/21.
//

import SwiftUI

/*
 "Views are a function of their state"
 In SwiftUI, views aren't changed directly; instead, they respond to changes in state.
 
 Ways to Manipulate State in SwiftUI
 
 @State
 Used to change the values of properties that belong to a specific view (and will never be used outside that view). @State properties are typically marked private to reinforce the idea that they should remain local to one view.
 
 @ObservedObject
 Used to share an external reference type across multiple views and watch for changes.
 
 The type that is shared must conform to the ObservableObject protocol.
 Typically, properties inside the type will be marked with @Published.
 
 @EnvironmentObject
 The same as @ObservedObject, except that it makes data available to all views through the application itself instead of needing to be passed around.
 A good choice when all views need to have access to the same model data.
 
 @StateObject
 The same as @ObservedObject, except it actually owns (creates) the object, rather than simply watching it for changes.
 
 Modifiers
 A method that changes how a view looks and behaves
 
 Styling Lists
 
 You can use the .listStyle modifier to change how a list appears.
 
 DefaultListStyle()
 GroupedListStyle()
 InsetGroupedListStyle()
 SideBarListStyle()
 
 @EnvironmentObject
 A property wrapper that shares model data anywhere it's needed and makes sure views are updated when changes are made.
 
 This is a simpler way to share data than @ObservedObject because all child views automatically have access to the same object. The data doesn't need to be passed around.
 
 Like @ObservedObject, an @EnvironmentObject property holds data that is passed in from elsewhere. Views use environment objects; they don't create or manage instances of them.
 
 Unlike @ObservedObject, environment objects aren't passed to views directly.
 The data is passed to other views through the .environmentObject() modifier.
 
 @StateObject
 A property wrapper that keeps an object alive throughout the life of an app.
 
 @StateObject is often paired with @EnvironmentObject: @StateObject creates an instance of a class, which is then passed to other views via @EnvironmentObject.
 
 
 
 
 
 */

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: ItemDetail(item: item)) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
