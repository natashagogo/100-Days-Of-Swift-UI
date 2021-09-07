//
//  User.swift
//  FriendFace
//
//  Created by Natasha Godwin on 9/5/21.
//

import Foundation


struct User: Codable {
	var id: String
	var isActive: Bool
	var name: String
	var age: Int
	var company: String
	var email: String
	var address: String
	var about: String
	var registered: String
	var tags: [String]
	var friends: [Friend]
}

struct Friend: Codable {
	var id: String
	var name: String
}

class Users: ObservableObject {
	@Published var list = [User]()
	
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
					self.list = decodedData
				}
			} else {
				print("Invalid response from the server.")
			}
		}.resume()
	}
}
