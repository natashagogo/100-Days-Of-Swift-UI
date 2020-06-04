//
//  MissionView.swift
//  Moonshot
//
//  Created by Natasha Godwin on 6/3/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.5)
                        .padding(.top)
                    
                    Text(self.mission.description)
                        .padding()
                    
                    // minLength makes sure the Spacer has a minimum height
                    // This is useful here because height is flexible inside ScrollView
                    Spacer(minLength: 25)
                }
            }
        }
         .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        MissionView(mission: missions[0])
    }
}
