//
//  ContentView.swift
//  GreysAnatomyWiki
//
//  Created by Natasha Godwin on 4/23/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let interns = [
        "Meredith Gray",
        "Cristina Yang",
        "Alex Karev",
        "Izzie Stevens",
        "George O'Malley"
      ]
    
    private var getRandomBio: String {
       let randomIntern = interns.randomElement() ?? "Cristina Yang"
       return randomIntern
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Browse Characters")) {
                    Text("\(getRandomBio)")
                }
                Section(header: Text("Fan Favorites")) {
                    ForEach(interns, id: \.self) {
                        Text($0)
                    }
                }
                Section(header: Text("Characters by Season")) {
                    ForEach(1..<17) {
                        Text("Season \($0)")
                    }
                }
                
            }.navigationBarTitle("👩🏻‍⚕️ Grey's Anatomy")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
