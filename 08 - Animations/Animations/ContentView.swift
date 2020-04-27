//
//  ContentView.swift
//  Animations
//
//  Created by Natasha Godwin on 4/25/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowing = false
    @State private var count = 0
    var body: some View {
        VStack {
            Button(isShowing ? "Close" : "Tap") {
                withAnimation {
                    self.isShowing.toggle()
                }
            }
            
            if isShowing {
                Button("\(count)") {
                    self.count += 1
                }
                .frame(width: 200, height: 200)
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.largeTitle)
                .clipShape(Rectangle())
                .transition(.scale)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
