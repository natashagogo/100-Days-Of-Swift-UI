//
//  ContentView.swift
//  QuotesApp
//
//  Created by Natasha Godwin on 5/11/21.
//

import SwiftUI



struct ContentView: View {
    @State private var items = [
        "Every action you take is a vote for the type of person you wish to become. - James Clear",
        "'Yes' is nothing without 'how'. - Chris Voss",
        "In the most minimal sense, the future is simply the set of all moments yet to come. But what makes the future distinctive and important isn’t that it hasn’t happened yet, but rather that it will be a time when the world looks different from today. … Most answers to the contrarian questions are different ways of seeing the present; good answers are as close as we can come to looking into the future. - Peter Thiel",
        "There's no music theory class Beethoven takes to become Beethoven. - Mike Maples",
        "The way people conceptualize a situation drives their behavior in that situation. This means that the analogies we use to make sense of new situations can be powerful forces — for better or worse — in determining how we act. - Melanie Mitchell",
        "The opposite of perfect is done. - Jon Acuff",
        "The antidote to advocacy is inquiry, which produces meaningful dialogue. - Roger L. Martin",
        "Solving a problem simply means representing a problem so as to make the solution transparent - Herbert Simon",
        "It's very easy to confuse the essence of what you're doing with the tools that you use. - Harold Abelson"
    ].shuffled()
    
    @State private var currentItem = ""
    
    var body: some View {
        VStack(spacing: 60) {
            ZStack {
                Color.blue
                    .edgesIgnoringSafeArea(.all)
                Text("\(currentItem)")
                    .foregroundColor(.white)
                    .font(.callout)
            }
            Button(action: {
                self.newItem()
            }) {
                Text("New Question")
            }
            .frame(width: 300, height: 60)
        }
        
    }
    
    func newItem() {
        currentItem = items.randomElement() ?? "Oops! It looks like we lost our connection."
        items.shuffle()
    }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

