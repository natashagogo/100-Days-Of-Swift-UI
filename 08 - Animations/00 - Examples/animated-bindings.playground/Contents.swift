import SwiftUI

// An example of an animated binding
// When the scale of the button changes, a default animation is added to the view 

struct ContentView: View {
    @State private var scale: CGFloat = 1

    var body: some View {
        print(scale)
        return VStack(spacing: 200) {
            Stepper("Count", value: $scale.animation(), in: 1...5)
                .padding(20)

            Button("\(scale, specifier: "%g")") {
                self.changeScale()
            }
            .padding(40)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(scale)
        }
    }
    
    func changeScale() {
        if self.scale != 5 {
            self.scale += 1
        } else {
            self.scale = 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
