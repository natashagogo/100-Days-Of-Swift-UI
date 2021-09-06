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
  4. Show details on each user's friends 
*/

import SwiftUI

struct ContentView: View {
	@State private var users = [User]()
    var body: some View {
		NavigationView {
			List(users, id: \.id) { user in
				NavigationLink(destination: DetailView(user: user)) {
					VStack(alignment: .leading) {
						Text(user.name)
						Text(user.company)
							.foregroundColor(.secondary)
					}
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
