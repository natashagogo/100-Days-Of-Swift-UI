import SwiftUI

// An example of how the order of implicit animations matter

struct ContentView: View {
    @State private var enabled = false
    var body: some View {
        Button(enabled ? "Don't Bother Me" : "Tap Me") {
            self.enabled.toggle()
        }
        .padding(40)
        .background(enabled ? Color.red : Color.blue)
        .animation(.easeIn) // applies an ease-in animation to the background
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 100 : 0))
        .animation(.interpolatingSpring(stiffness: 80, damping: 5)) // applies a spring animation to the shape change
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
