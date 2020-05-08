//
//  MissionView.swift
//  Moonshot
//
//  Created by Natasha Godwin on 5/7/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let astronauts: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                     .resizable()
                     .scaledToFit()
                     .frame(maxWidth: geometry.size.width * 0.5) // 50% the size of original
                     .padding(.top)
                    
                    Text(self.mission.displayName)
                        .font(.largeTitle)
                    Text(self.mission.formattedLaunchDate)
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Text(self.mission.description)
                     .padding()
                    
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                    Spacer(minLength: 25)
                    
                }
            }
        }.navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name}) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[3], astronauts: astronauts)
    }
}
