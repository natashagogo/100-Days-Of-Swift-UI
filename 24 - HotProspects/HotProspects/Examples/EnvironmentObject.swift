//
//  EnvironmentObject.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/3/21.
//

import SwiftUI

class User: ObservableObject {
	@Published var name = "Taylor Swift"
}

struct EditView: View {
	 @EnvironmentObject var user: User
	 var body: some View {
		  TextField("Name", text: $user.name)
			.textFieldStyle(RoundedBorderTextFieldStyle())
			.padding()
	 }
}

struct DisplayView: View {
	 @EnvironmentObject var user: User
	 var body: some View {
		  Text("Hello, \(user.name)!")
	 }
}

struct EnvironmentObjectExample: View {
	let user = User() // Why isn't this wrapped in @StateObject?
    var body: some View {
		VStack {
			DisplayView()
			EditView()
		}
		.environmentObject(user)
    }
}

struct EnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectExample()
    }
}
