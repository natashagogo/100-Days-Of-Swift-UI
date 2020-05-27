//
//  ContentView.swift
//  ProgressBar
//
//  Created by Natasha Godwin on 4/17/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float // receives data from State variable in ContentView
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(.blue)
                
                // Calculate the width of the progress indicator by ...
                // 1. Mutiplying current progressValue by the width of the parent view.
                // 2. Making sure it doesn't exceed width of parent.
                Rectangle().frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(.blue)
                    .animation(.linear)
            }.cornerRadius(45.0)
            
        }
    }
}

struct ContentView: View {
    @State var progressValue: Float = 0.0
    var body: some View {
        VStack {
            ProgressBar(value: $progressValue).frame(height: 20)
            Button("Next") {
                self.next()
            }.padding()
            
            Button("Reset") {
                self.reset()
            }.padding()
            Spacer()
        }.padding()
    }
    
    func next() {
        let steps: Float = 10
        let step: Float = steps / 100

        self.progressValue += step
    }
    
    func reset() {
       self.progressValue = 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
