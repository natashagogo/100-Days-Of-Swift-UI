//
//  DetailView.swift
//  FriendFace
//
//  Created by Natasha Godwin on 9/6/21.
//

import SwiftUI

struct DetailView: View {
	@Environment(\.managedObjectContext) var viewContext
	@FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
	let user: User
	
    var body: some View {
		ScrollView {
			VStack(spacing: 10) {
				Image(systemName: "person.crop.circle.fill.badge.plus")
					.font(.system(size: 75))
					.foregroundColor(.gray)
				user.isActive == true ? StatusView(text: "Active"): StatusView(text: "Inactive")
			}.padding()
			VStack(alignment: .leading, spacing: 10) {
				Group {
					Text("Biography")
						.font(.headline)
						.foregroundColor(.blue)
				 Text(user.wrappedAbout)
				}
				Group {
					Text("Friends")
						.font(.headline)
						.foregroundColor(.blue)
					ForEach(user.friendsArray, id: \.id) { friend in
						HStack {
							Image(systemName: "person.circle.fill")
								.font(.largeTitle)
								.foregroundColor(.gray)
							self.findFriend(friend: friend, in: users).map {
								NavigationLink(destination: DetailView(users: _users, user: $0)) {
									Text(friend.wrappedName)
								}
							}
						}
				   }
				}
			}
			.lineSpacing(5.0)
			.padding()
			Spacer()
		}.navigationBarTitle(user.wrappedName, displayMode: .inline)
	}
	
	func findFriend(friend: Friend, in list: FetchedResults<User>) -> User? {
	  if let user = list.first(where: {($0.id == friend.id) && ($0.name == friend.name)}) {
			return user
	  }
	  return nil
	}
}

