//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Natasha Godwin on 5/13/21.
//

/*
 Questions To Answer
 
 Why does SwiftUI use structs for views?
 
 Structs are faster, simpler, and more predictable than classes because they don't have to (and can't) inherit properties and methods from other entities.
 
 What is behind the main SwiftUI view?
 
 Technically, UIHostingController, a bridge between UIKit and SwiftUI, is behind ContentView. But, as far as development goes, there's nothing behind the view. That's why adding a background modifier to a view will only change its background color, not the background of the entire screen.
 
 
 Why does the order of modifiers matter?
 
 When you add a modifier to a view, SwiftUI creates a new view with the change applied, using the generic container ModifiedContent. It doesn't simply change a property.
 
 That means that changes stack up. Each modifier adds to whatever was there before.
 
 
 Why does SwiftUI use some View for its view type?
 
 some View gives you the flexibility to add any object that conforms to the View protocol to the body property without having to specify what type beforehand. It's why you can add any built-in or custom view you want.
 
 The View protocol has an associated type attached to it, meaning that you have to specify what kind of view it is. SwiftUI needs to know what's inside the view before it can render it.
 
 The some keyword allows you to get around that requirement.
 
 Why can't you add a property that contains a View without giving it a value?
 
 The View protocol has an associated type attached to it, meaning that you have to specify what kind of view it is. SwiftUI needs to know what's inside the view before it can render it.
 
 What does a stack contain?
 
 A TupleView
 

 How do you create a custom modifier?
 
 1. Create a struct that conforms to the ViewModifier protocol. It has one requirement: a method called body that accepts content and returns some view.
 2. To make it easier to use, write an extension on View and add a method that returns some View
 
 
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI!")
			 .titleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
