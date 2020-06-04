//
//  ContentView.swift
//  Moonshot
//
//  Created by Natasha Godwin on 6/1/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // The data types need to be specified here because the decode method in the Bundle extension was written with generics
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingLaunchDate = false
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if(self.showingLaunchDate) {
                            Text(mission.formattedLaunchDate)
                             .font(.subheadline)
                             .foregroundColor(.secondary)
                        } else {
                            // crewMembers is a computed property in Mission.swift that contains all of the names in the CrewRole struct.
                            ForEach(mission.crewMembers, id: \.self) {
                                Text("\(self.getFullNames($0))")
                                 .font(.subheadline)
                                .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
           .navigationBarTitle("Moonshot")
           .navigationBarItems(trailing: Button(action: {
                self.showingLaunchDate.toggle()
            }) {
                Text(showingLaunchDate ? "Show Crew Names" : "Show Launch Dates")
            })
        }
    }
    // This function will compare each astronaut id with the value passed in the name parameter 
    // If it matches, it will return the astronaut's full name
    func getFullNames(_ name: String) -> String {
        if let match = astronauts.first(where: {$0.id == name}) {
            return match.name
        } else {
            fatalError("Missing name")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
