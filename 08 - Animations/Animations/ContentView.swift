//
//  ContentView.swift
//  Animations
//
//  Created by Natasha Godwin on 4/25/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var scale: CGFloat = 1
    var body: some View {
        Button("Tap Me") {
            self.scale += 1
        }
        .padding(40)
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(scale)
        .animation(.interpolatingSpring(stiffness: 50, damping: 2))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
