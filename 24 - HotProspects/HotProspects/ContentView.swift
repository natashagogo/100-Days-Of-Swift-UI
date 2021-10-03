//
//  ContentView.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/3/21.
//

import SwiftUI

/*

The road to success is always under construction.
- Lily Tomlin

What is the difference between @State, @ObservedObject, and @EnvironmentObject

@State updates values that are local to one view. Any changes made can't be shared with other views.
@ObservedObject passes an object from view to view.
@EnvironmentObject places an object into the environment, giving all child views access to it. This is ideal in two situations: (1) when all views need access to the same data and (2) when some views need access to the data, but not others.

Both @ObservedObject and @EnvironmentObject objects must conform to the same protocol: ObservableObject

When should you use a navigation view?
When users need to drill down into data, e.g. tap a row in a list to get details.
You shouldn't use a navigation view for showing unrelated data.


How do you create a tab bar?
1. Place all elements inside a TabView
2. Attach the .tabItem() modifier to each view inside.

How do you create a tab bar programmatically?

1. Create an @State property to track the tab that is currently showing.
2. Modify that property to a new value whenever we want to jump to a different tab.
3. Pass that as a binding into the TabView, so it will be tracked automatically.
4. Tell SwiftUI which tab should be shown for each value of that property.



What does the .tabItem() modifier do?
It lets you customize how each tab appears in the TabView.
You can add an image and some text, for example.


*/

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
