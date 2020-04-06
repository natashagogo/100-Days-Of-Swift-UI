//
//  ContentView.swift
//  Message Stacks
//
//  Created by Natasha Godwin on 4/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill")
                Text("Hello, World!")
                Spacer() // pushes HStack to the left
            }
            .padding()
            .font(.title)
            
            HStack {
              Spacer() // pushes HStack to the right
              Image(systemName: "globe")
              Text("Hello, Natasha!")
            }
            .padding()
            .font(.largeTitle)
            .foregroundColor(.blue)
            
            Spacer() // pushes VStack to the top
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
