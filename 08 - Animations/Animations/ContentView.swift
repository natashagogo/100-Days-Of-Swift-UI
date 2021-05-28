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

// Example 8
// You can attach this to any view using .transition(.pivot)

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        // Rotate along the Z axis, but don't go outside the container
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
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
