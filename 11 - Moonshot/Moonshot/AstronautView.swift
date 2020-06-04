//
//  AstronautView.swift
//  Moonshot
//
//  Created by Natasha Godwin on 6/4/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let missionsFlown: [String]
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        
        var matches = [String]()
        
        for mission in missions {
            if mission.crew.contains(where: { $0.name == astronaut.id }) {
                matches.append("\(mission.displayName)")
            }
        }
        self.missionsFlown = matches
    }
    
    var body: some View {
        GeometryReader { geometry in
           ScrollView(.vertical) {
               VStack {
                   Image(self.astronaut.id)
                       .resizable()
                       .scaledToFit()
                       .frame(width: geometry.size.width)
                VStack(alignment: .leading, spacing: 10) {
                    Text(self.astronaut.description)
                       .layoutPriority(1) // makes sure text doesn't get cut off
                    Text("Missions Flown")
                        .font(.headline)
                    ForEach(self.missionsFlown, id: \.self) { mission in
                        Text("\(mission.description)")
                         .font(.subheadline)
                    }
                }
                 .padding()
              }
            }
         }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
