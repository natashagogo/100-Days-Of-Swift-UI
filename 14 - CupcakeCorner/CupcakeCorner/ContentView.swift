//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 6/13/21.
//


import SwiftUI

/*
 How to make Published properties in a class conform to Codable

 1. Tell Swift which properties need to be loaded and saved. Create an enum that conforms to the CodingKey protocol and list the properties that should be archived and unarchived.

2. Create a custom initializer. Give the initializer a new instance of Decoder, which contains all of the app's data. Create a container whose keys match whatever cases are in the CodingKey enum. Since it's possible those keys don't exist, this should be written as a throwing call. Read values directly from the container by references cases in the enum.

3. Write a function that tells Swift how to encode the data. This is the reverse of the custom initializer: give it an Encoder instance, create a container using the CodingKeys enum for keys, then write out the values attached to each key.

What does the required keyword do?
The required means that values must be overridden with a custom implementation.
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

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
