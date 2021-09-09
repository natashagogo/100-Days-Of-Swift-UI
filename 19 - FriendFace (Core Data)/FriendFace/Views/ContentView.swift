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
  5. Add Core Data
*/

import SwiftUI

struct ContentView: View {
	@Environment(\.managedObjectContext) var viewContext
	@FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    var body: some View {
		NavigationView {
			List(users, id: \.self) { user in
				NavigationLink(
					destination: DetailView(user: user).environment(\.managedObjectContext, self.viewContext)) {
					VStack(alignment: .leading) {
						Text(user.wrappedName)
						Text(user.wrappedCompany)
							.foregroundColor(.secondary)
					}
				}
			}
			.onAppear(perform: loadData)
			.navigationTitle("FriendFace")
		}
	}
	
	func loadData() {
	
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
