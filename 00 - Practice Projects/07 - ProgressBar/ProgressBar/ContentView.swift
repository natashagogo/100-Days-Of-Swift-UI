//
//  ContentView.swift
//  ProgressBar
//
//  Created by Natasha Godwin on 6/17/21.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.5)
                    .foregroundColor(Color(UIColor.systemTeal))
                Rectangle()
                    .frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .animation(.linear)
                    .foregroundColor(Color.blue)
            }
            .cornerRadius(50.0)
        }
    }
}

struct ContentView: View {
    @State private var progress: Float = 0.0
    
    let finished: Float = 1.0
    
    var body: some View {
        VStack {
            ProgressBar(value: $progress)
              .frame(height: 15)
            
            if progress < finished {
                Button(action: self.addProgress) {
                    Text("Update Progress")
                }
            } else {
                Button(action: self.resetProgress) {
                    Text("Reset")
                }
            }
        }
        .padding()
    
    }
    
    func addProgress() {
        self.progress += 0.10
    }
    
    func resetProgress() {
        self.progress = 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
