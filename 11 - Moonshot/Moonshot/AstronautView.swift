//
//  AstronautView.swift
//  Moonshot
//
//  Created by Natasha Godwin on 6/5/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    /*
     This was my attempt to complete the following challenge:
      Modify AstronautView to show all the missions this astronaut flew on.
     Unfortunately, it doesn't work. Coming back to this one later.
     
     let missions: [Mission]
     
     init(astronaut: Astronaut, missions: [Mission]) {
         self.astronaut = astronaut
         var matches = [Mission]()
         
         for mission in missions {
             for member in mission.crew {
                 if astronaut.id == member.name {
                     matches.append(mission)
                 } else {
                     fatalError("No missions found.")
                 }
             }
         }
         self.missions = matches
     }
     
     */
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    /*ForEach(missions) { mission in
                        Text("\(mission.displayName)")
                    }*/
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    /*static let missions: [Mission] = Bundle.main.decode("missions.json")*/
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
