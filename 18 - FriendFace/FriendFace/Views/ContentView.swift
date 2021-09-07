//
//  ContentView.swift
//  FriendFace
//
//  Created by Natasha Godwin on 8/25/21.
//

/*
  1. Download data from the Internet ✅
  2. Convert it to Swift types with Codable ✅
  3. Display the results in a list, with a DetailView ✅
  4. Show details on each user's friends ✅
*/

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var users: Users
    var body: some View {
		NavigationView {
			List(users.list, id: \.id) { user in
				NavigationLink(destination: DetailView(user: user)) {
					VStack(alignment: .leading) {
						Text(user.name)
						Text(user.company)
							.foregroundColor(.secondary)
					}
				}
			}
			.onAppear(perform: users.loadData)
			.navigationTitle("FriendFace")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(Users())
    }
}
