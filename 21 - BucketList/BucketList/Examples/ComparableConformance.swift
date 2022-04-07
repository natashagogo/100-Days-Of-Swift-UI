//
//  ComparableConformance.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/20/21.
//

import SwiftUI

struct User: Identifiable, Comparable {
	let id = UUID()
	let firstName: String
	let lastName: String
	
	static func < (lhs: User, rhs: User) -> Bool {
		lhs.lastName < rhs.lastName
	}
}

struct ComparableConformance: View {
	let users = [
		 User(firstName: "Taylor", lastName: "Swift"),
		 User(firstName: "Billie", lastName: "Eilish"),
		 User(firstName: "Lana", lastName: "Del Rey"),
	].sorted()
	 var body: some View {
		List(users) { user in
			Text("\(user.firstName) \(user.lastName)")
		}
	 }
}

struct ComparableConformance_Previews: PreviewProvider {
    static var previews: some View {
        ComparableConformance()
    }
}
