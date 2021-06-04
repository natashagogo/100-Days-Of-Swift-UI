//
//  ContentView.swift
//  Moonshot
//
//  Created by Natasha Godwin on 6/3/21.
//

import SwiftUI


struct ContentView: View {
    // Types need to be specified here because the Bundle extension uses generics
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        VStack {
            Text("Number of astronauts: \(astronauts.count)")
            Text("Number of missions: \(missions.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
