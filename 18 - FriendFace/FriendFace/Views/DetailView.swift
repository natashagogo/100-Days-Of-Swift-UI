//
//  DetailView.swift
//  FriendFace
//
//  Created by Natasha Godwin on 9/6/21.
//

import SwiftUI

struct DetailView: View {
	let user: User
    var body: some View {
		ScrollView {
			VStack(spacing: 10) {
				Image(systemName: "person.crop.circle.fill.badge.plus")
					.font(.system(size: 75))
					.foregroundColor(.gray)
				if user.isActive == true {
					Text("Active")
						.frame(width: 120, height: 20)
						.foregroundColor(.white)
						.background(Color.blue)
						.clipShape(RoundedRectangle(cornerRadius: 5.0))
				} else {
					Text("Inactive")
						.frame(width: 120, height: 20)
						.foregroundColor(.white)
						.background(Color.gray)
						.clipShape(RoundedRectangle(cornerRadius: 5.0))
				}
			}.padding()
			VStack(alignment: .leading, spacing: 10) {
				Group {
					Text("Biography")
						.font(.headline)
						.foregroundColor(.blue)
					Text(user.about)
				}
				Group {
					Text("Friends")
						.font(.headline)
						.foregroundColor(.blue)
					ForEach(user.friends, id: \.id) { friend in
						HStack {
							Image(systemName: "person.circle.fill")
								.font(.largeTitle)
								.foregroundColor(.gray)
							Text(friend.name)
						}
				   }
				}
			}
			.lineSpacing(5.0)
			.padding()
			Spacer()
		}.navigationBarTitle(user.name, displayMode: .inline)
	}
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//		DetailView()
//    }
//}
