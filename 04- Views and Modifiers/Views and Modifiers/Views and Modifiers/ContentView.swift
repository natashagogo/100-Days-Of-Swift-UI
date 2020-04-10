//
//  ContentView.swift
//  Views and Modifiers
//
//  Created by Natasha Godwin on 4/10/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue // creates a blue "background"
            
            Text("Hello, World!")
                .foregroundColor(.white)
                .font(.largeTitle)
                
                .frame(width: 200, height: 100) // changes the size of the Text view.
                .background(Color.pink) // adds a pink "background"
                .padding() // adds space around it to create a layering effect
                .background(Color.white)
                .padding()
                .background(Color.pink)
                .padding()
                .background(Color.white)
                
                .frame(width: 100, height: 1000)
                .background(Color.black)
                .padding()
                .background(Color.white)
                .padding()
                .background(Color.black)
                .padding()
                .background(Color.white)
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
