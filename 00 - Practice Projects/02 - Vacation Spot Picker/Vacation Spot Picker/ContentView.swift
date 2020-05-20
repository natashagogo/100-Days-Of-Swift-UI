//
//  ContentView.swift
//  Vacation Spot Picker
//
//  Created by Natasha Godwin on 4/2/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI


import SwiftUI

struct DestinationView: View {
    var name: String
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Image(self.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width)
          }
            .frame(height: 300)
         Spacer()
       }
    }
}

struct ContentView: View {
    let destinations = [
        "tokyo",
        "kyoto",
        "osaka",
        "hokkaido"
    ]
    
    var body: some View {
        NavigationView {
            List(destinations, id: \.self) { place in
                NavigationLink(destination: DestinationView(name: "\(place)")) {
                    Text("\(place.capitalized)")
                }
            }.navigationBarTitle("Japan")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

