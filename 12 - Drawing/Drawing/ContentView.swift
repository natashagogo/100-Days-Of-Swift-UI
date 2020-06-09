//
//  ContentView.swift
//  Drawing
//
//  Created by Natasha Godwin on 6/7/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

// .colorMultiply()


struct ContentView: View {
    @State private var amount: CGFloat = 0.0
    var body: some View {
        VStack {
            Image("pattern")
             .resizable()
             .scaledToFit()
             .frame(width: 200, height: 200)
             .saturation(Double(amount) * 2)
             .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
