//
//  ContentView.swift
//  Animations
//
//  Created by Natasha Godwin on 5/26/21.
//

import SwiftUI

/*
 
 Animation Stack
 Since modifier order matters, you can animate different parts of a view by adding multiple .animation() modifiers. Anything that comes before each modifier will be animated.
 
 Animating Gestures
 To move an object around the screen and animate it:
 
 1. Create a state variable that stores the drag amount
 2. Use the .offset() modifier to adjust the X and Y position of the view without affecting the others on the screen
 3. Add a .gesture() modifier to the view and attach DragGesture to the card. Then add the modifiers onChanged(), which runs a closure when a view is moved, and .onEnded(), which runs a closure where the user lifts their finger.
 
 Transition
 The transition() modifier specifies how a view should be animated when it is shown or hidden.
 
 .transition(.scale)
 
 Tips
 You can turn the letters in a string into an array with Array()
 Use the .asymmetric modifier to do one transition when a view is shown and another when it's disappearing.
 
 .transition(.asymmetric(insertion: .opacity, removal: .scale))
 
 */

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

// Example 4
struct AnimatedShape: View {
    @State private var enabled = false
    @State private var animationAmount: CGFloat = 1
    var body: some View {
        Button(enabled ? "Bounce": "Tap") {
            self.enabled.toggle()
            if animationAmount < 2 {
                self.animationAmount += 1
            } else {
                self.animationAmount -= 1
            }
        }
        .frame(width: 100, height: 100)
        .background(enabled ? Color.blue : Color.gray)
        .animation(.default)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60: 0))
        .scaleEffect(animationAmount)
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
   }
}

// Example 5
struct DragQueen: View {
    @State private var dragAmount = CGSize.zero
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { self.dragAmount = $0.translation }
                        // Animate on release
                        .onEnded {_ in
                            withAnimation(.spring()) {
                                self.dragAmount = .zero
                            }
                        }
                )
        }
    }
}

// Example 6
struct SnakeLetters: View {
    let message = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<message.count) { index in
                Text(String(self.message[index]))
                    .padding(2)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(self.enabled ? Color.red : Color.blue)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(index) / 20))
                
            }
        }
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                }
        )
        
    }
}

// Example 7
struct ShowAndHide: View {
    @State private var isShowing = false
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowing.toggle()
                }
            }
            if isShowing {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 200, height: 200)
                    .transition(.scale)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        ShowAndHide()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
