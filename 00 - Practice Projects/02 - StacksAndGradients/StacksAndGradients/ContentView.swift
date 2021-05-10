//
//  ContentView.swift
//  StacksAndGradients
//
//  Created by Natasha Godwin on 5/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .bottom, endPoint: .top)
                    .edgesIgnoringSafeArea(.all)
                Text("Hello, Stacks!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            ForEach(0..<3) { _ in
                HStack {
                    ForEach(0..<3) {_ in
                        AngularGradient(gradient: Gradient(colors: [Color.white, Color.blue, Color.white, Color.blue, Color.white, Color.blue, Color.white, Color.blue, Color.white, Color.blue]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                .frame(width: 300, height: 90)
            }
            Button(action: {
                self.showingAlert = true
            }) {
                HStack {
                    Image(systemName: "photo.fill")
                    Text("Add Image")
                }
                .frame(width: 300, height: 60)
                }
               .alert(isPresented: $showingAlert) {
                Alert(title: Text("Gorgeous!"), message: Text("You just added a new image to your profile."
                ), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
