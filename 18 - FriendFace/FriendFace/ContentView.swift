//
//  ContentView.swift
//  FriendFace
//
//  Created by Natasha Godwin on 8/25/21.
//

/*

NOTES

What is type erasure?
The process of hiding the underlying type of some data.

When is it better to use AnyView than Group?
1. When there isn't a performance cost.
2. When you want to add views to an array, e.g. Shape or Group


When should you use Group?
1. To get around the 10-child view limit. Each group can have ten children of its own, so you can have groups inside groups to create much more complex layouts.
2. To delegate layout to a parent container. If you make a custom view that has a group as the top-level thing in its body, you can embed that view inside a HStack or a VStack to dynamically change its layout.
3. To apply modifiers to multiple views.

Why should you use the name CodingKeys for your enum of coding keys?

1. Swift with automatically use it to decide how to encode and decode an object. Assuming your property names match those in the data, this means you don't have to write custom Codable implementations.
2. You can easily translate property names from the data source to ones in your Swift code by adding associated values to the enum cases.

Example:

let data = """
{
  symptom: "brain fog",
  level: "severe"
}
"""

struct Symptom: Codable {
 
  enum CodingKeys: String, CodingKey {
    case symptomName = "symptom"
    case intensity = "level"
  }

  var symptomName: String
  var intensity: String

}
*/

/*
  1. Download data from the Internet
  2. Convert it to Swift types with Codable
  3. Display the results in a list, with a DetailView
*/

import SwiftUI

struct ContentView: View {
	@State private var users = [User]()
    var body: some View {
		NavigationView {
			List(users, id: \.id) { user in
				VStack(alignment: .leading) {
					Text(user.name)
					Text(user.company)
						.foregroundColor(.secondary)
				}
			}
			.onAppear(perform: loadData)
			.navigationTitle("FriendFace")
		}
    }
	
	func loadData() {
		guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
			print("Invalid URL")
			return
		}
		let request = URLRequest(url: url)
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			guard let data = data else {
				print("No data in response: \(error?.localizedDescription ?? "Unknown Error")")
				return
			}
			
			if let decodedData = try? JSONDecoder().decode([User].self, from: data) {
				DispatchQueue.main.async {
					users = decodedData
				}
			} else {
				print("Invalid response from the server.")
			}
		}.resume()
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
