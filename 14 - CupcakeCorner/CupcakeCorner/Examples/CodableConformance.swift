//
//  CodableConformance.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 7/28/21.
//

import SwiftUI

/*

This is an example of how to create custom Codable conformance for @Published properties. See the end of the file for notes.
*/

class User: ObservableObject {
	@Published var name = ""
	
	// 1.
	enum CodingKeys: CodingKey {
		case name
	}
	
	// 2.
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		name = try container.decode(String.self, forKey: .name)
	}
	
	// 3.
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(name, forKey: .name)
	}
	
	init() {}
}

struct CodableConformance: View {
	@StateObject private var user = User()
	 var body: some View {
		VStack {
			Text("Hello, \(user.name)!")
			TextField("Name", text: $user.name)
				.textFieldStyle(RoundedBorderTextFieldStyle())
				.padding()
		}
	 }
}

struct CodableConformance_Previews: PreviewProvider {
    static var previews: some View {
        CodableConformance()
    }
}
