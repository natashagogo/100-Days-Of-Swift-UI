//
//  MainView.swift
//  iDine
//
//  Created by Natasha Godwin on 6/23/21.
//

/*
 
 How to add tabs to an app
 Embed existing views in TabView {}
 Add a tab.Item modifier to each, with a Label view inside its closure.
 
 TabView {
   FirstView()
    .tabItem {
        Label("First", systemImage: "one.fill")
     }
   SecondView()
    .tabItem {
      Label("Second", systemImage: "two.fill")
    }
 
 }
 
SwiftUI's approach to user interfaces
 
SwiftUI is declarative, meaning that you say what behavior you want rather than specifying it precisely. This allows SwiftUI to adapt to the context that it's being used in.
 
 Toggle()
 NumberFormatter()
 
 
 */

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
    }
}
