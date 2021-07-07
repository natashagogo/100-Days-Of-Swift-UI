//
//  DetailView.swift
//  FriendFinder
//
//  Created by Natasha Godwin on 7/7/21.
//

import SwiftUI

struct DetailView: View {
    let user: User
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading, spacing: 10) {
                Group {
                   Text("Interests")
                       .font(.title)
                   ForEach(user.tags, id: \.self) { tag in
                       Text("#\(tag)")
                         .frame(width: 150)
                         .background(Color.blue)
                         .clipShape(Capsule())
                    }
                }
              Group {
                Text("Friends")
                    .font(.title)
                ForEach(user.friends, id: \.id) { friend in
                    VStack {
                        Text(friend.name)
                    }
                }
             }         }
        .frame(maxWidth: .infinity)
        .navigationBarTitle("\(user.name)", displayMode: .inline)
    }
  }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(id: "01", isActive: false, name: "Biomedical Muse", age: 32, company: "Apple", email: "biomedicalmuse@example.com", address: "555 Fake Street", about: "N/A", registered: "01/15/2021", tags: ["medicine", "biology", "computer science"], friends: [Friend(id: "01", name: "Friend")]))
    }
}
