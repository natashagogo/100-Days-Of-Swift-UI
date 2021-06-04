//
//  ContentView.swift
//  Moonshot
//
//  Created by Natasha Godwin on 6/3/21.
//

import SwiftUI


struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    var body: some View {
        Text("\(astronauts.count)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
