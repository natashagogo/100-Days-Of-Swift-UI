//
//  ContentView.swift
//  WeSplit
//
//  Created by Natasha Godwin on 5/6/21.
//

import SwiftUI

// 1. Basic SwiftUI app structure

// Your UI will appear inside a struct called ContentView, which conforms to the View protocol.
// The View protocol only has one requirement: a computed property called body, which must return something that conforms to the View protocol.
// The keyword some adds an important restriction: you can only return one view.
// Inside this property are different types of views: text, image, etc.

// 2. Creating a form

// You can create a basic form by placing views inside Form {}
// Each form can have up to 10 views.
// If you need more, divide your views into groups with Group {}. This won't change the appearance of your app; it's just a workaround.
// If you want visible groups, use Section {}
// In SwiftUI, parent views can only contain 10 children.

// 3. Adding a Navigation View

// To add titles to a view, use a Navigation View. This will also make your app look better on scroll.
// You can add text for the title with the .navigationBarTitle() modifier.
// A modifier is a method that always returns a new instance of whatever you use it on.
// By default, titles are big.
// If you want to make them smaller, use .navigationBarTitle("Title", displayMode: .inline)

// 3. Modifying program state
// "Views are a function of their state."
// This is a common expression in the Swift developer community. It means that your user interface's appearance is determined by the state of the program. This is a radical departure from the approach used previously, where an app's UI was determined by a sequence of events, in which case users couldn't pick up where they left off: they would have to repeat the exact same sequence of actions.

// State
// The active collection of settings that describe how a user interface looks at present.

// In SwiftUI, all views are structs, which are immutable. This means that property values can't be changed directly.
// That creates problems when it comes to updating the state of your program.

// @State
// A property wrapper that allows you to change the value of a property inside a struct.
// As a best practice, use private access control.
// This is one of many ways of storing program state in SwiftUI.

// Binding State to UI controls
// Some views need to read and write changes, or in other words, store and update property values.
// This is called two-way binding: the property reads the changes to display them and writes changes to update its value.
// In SwiftUI, properties that have two-way binding are preceded by the $ symbol.

// Dynamically Creating Views

// ForEach
// A view that loops over items in an array or range and returns a view for each one.
//It runs a closure for each item in the collection, passing in the current item, and then returns a view.
// Isn't limited to 10 views, like most views in SwiftUI.


struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
