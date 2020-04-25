import SwiftUI

// An example of a customized implicit animation
// Adds a repeating scale animation to a circle overlay when the view appears

struct ContentView: View {
    @State private var scale: CGFloat = 1
    var body: some View {
        Button("Tap Me") {
            // self.scale += 1
        }
        .padding(40)
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.blue)
                .scaleEffect(scale)
                .opacity(Double(2 - scale))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
        )
        .onAppear {
            self.scale = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
