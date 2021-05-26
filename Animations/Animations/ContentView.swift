//
//  ContentView.swift
//  Animations
//
//  Created by Natasha Godwin on 5/26/21.
//

import SwiftUI

// Example 1
struct AnimatedButton: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        ZStack {
            Color(.blue)
                .edgesIgnoringSafeArea(.all)
            Button("Tap Me") {
            }
            .padding(50)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.white)
                    .scaleEffect()
                    .scaleEffect(animationAmount) // scale
                    .opacity(Double(2 - animationAmount)) // fade
                    .animation(
                        Animation.easeOut(duration: 1)
                            .repeatForever(autoreverses: false)
                    )
            )
            .onAppear {
                self.animationAmount = 2
            }
        }
    }
}

// Example 2
struct AnimatedStepper: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack(spacing: 150) {
            Stepper("Scale amount: \(animationAmount, specifier: "%g")", value: $animationAmount.animation(
                Animation.easeInOut(duration: 1)
            ), in: 1...4)
            Button("Tap Me") {
                if animationAmount < 4 {
                    self.animationAmount += 1
                }
            }
            .padding(40)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

// Example 3
struct ExplicitAnimation: View {
    @State private var animationAmount = 0.0
    var body: some View {
        Button("Tap Me") {
            // This will delay the animation
            withAnimation {
                self.animationAmount += 360
            }
            
        }
        .padding(50)
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ContentView: View {
    var body: some View {
        ExplicitAnimation()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
