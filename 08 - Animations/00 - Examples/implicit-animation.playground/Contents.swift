import SwiftUI

// Simple example of an implicit animation
// Adds a spring animation to a button when its size changes

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
