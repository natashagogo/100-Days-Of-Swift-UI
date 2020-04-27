import SwiftUI

struct ContentView: View {
    let letters = Array("Quarantine")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< letters.count) { number in
                Text(String(self.letters[number].uppercased()))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.red : Color.blue)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(number) / 20))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

