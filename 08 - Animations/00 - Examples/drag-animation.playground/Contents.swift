import SwiftUI

// An example of a DragGesture animation
// When the user drags the card, it changes position and snaps back into place

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded {_ in
                    withAnimation(.spring()) {
                        self.dragAmount = .zero
                    }
                    
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
