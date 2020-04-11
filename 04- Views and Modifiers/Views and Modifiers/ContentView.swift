//
//  ContentView.swift
//  Views and Modifiers
//
//  Created by Natasha Godwin on 4/10/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
         .foregroundColor(.blue)
         .font(.largeTitle)
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}


struct ContentView: View {
    var body: some View {
       Text("Hello, World!")
        .titleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
