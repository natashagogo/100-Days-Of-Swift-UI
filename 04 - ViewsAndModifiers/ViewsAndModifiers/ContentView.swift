//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Natasha Godwin on 5/13/21.
//

import SwiftUI

/*
 
 Why does SwiftUI use structs for views?
 
 It keeps things simple, which is better for performance and code readability.
 
 In UIKit, all views are classes, which means they inherit the properties and methods from Apple's built-in classes, even if they don't need them. That's bad for performance and creates some frustrating side-effects.
 
 Structs are better because you have to be intentional about where to put data and which properties require state. A struct converts data into UI.
 
 What's behind the main view?
 
 Nothing except UIHostingController, a bridge between UIKit (Apple's original UI framework) and SWiftUI, which will break your code if altered.
 
 In practice, that means if you want to change the background color of the screen, you need to expand the current view's frame.
 
 What happens when you add a modifier to a view?
 
 SwiftUI creates a new view. This is why modifier order matters: each view is stacked on top of other views.  For example, if you change the background color of a view before expanding it's frame, the frame won't have the same color.
 
 This explanation is a simplification, and like all simplifications, isn't 100% accurate. Under the hood, SwiftUI doesn't actually create a new view; it simply uses generics to apply the modifiers, but not to the current view directly. But "new modifier = new view" is a nice mental shortcut to use for now.
 
 What's the deal with some View?
 
 SwiftUI heavily relies on opaque return types. some View is a good example of what those are: it tells SwiftUI it will return a View, but doesn't specify the type.
 
The View protocol has an associated type attached to it. Until that is given a value, View doesn't actually have any meaning.
 
 They some keyword is convenient, because it allows you to get around this requirement without limiting yourself to one specific type. You can create a Text view and then wrap it in a NavigationView and add a Form, and your code will still compile.
 
 
 */

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .background(Color.white)
            .padding()
            .background(Color.white)
            .padding()
            .background(Color.blue)
            .padding()
            .background(Color.white)
            .padding()
            .background(Color.blue)
            .padding()
            .background(Color.blue)
            .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
