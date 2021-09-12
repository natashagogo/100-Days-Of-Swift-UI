//
//  ContentView.swift
//  FriendFace
//
//  Created by Natasha Godwin on 8/25/21.
//


import SwiftUI

struct ContentView: View {
	@Environment(\.managedObjectContext) var viewContext
	@FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    var body: some View {
		NavigationView {
			List(users, id: \.self) { user in
				NavigationLink(
					destination: DetailView(user: user).environment(\.managedObjectContext, self.viewContext)) {
					VStack(alignment: .leading) {
						Text(user.wrappedName)
						Text(user.wrappedCompany)
							.foregroundColor(.secondary)
					}
				}
			}
			.navigationTitle("FriendFace")
		}.onAppear(perform: fetchAndSaveUserData)
	}
	
	func fetchAndSaveUserData() {
		// Create the URL
		guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
			print("Invalid URL")
			return
		}
		
		// Wrap it in a URLRequest
		var request = URLRequest(url: url)
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = "GET"
		
		// Run the request and process the response
		URLSession.shared.dataTask(with: request) { data, response, error in
			// Handle the result
			guard let unwrappedData = data else {
				// Show the error message
				print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
				return

			}
			
			// Decode JSON to Core Data objects
			let decoder = JSONDecoder(context: viewContext)
			if let decodedData = try? decoder.decode([User].self, from: unwrappedData) {
				print("There were \(decodedData.count) users placed into Core Data")
			} else {
				print("Could not decode from JSON into Core Data.")
			}
			
		}.resume()
		
		
		// Write changes to Core Data
		do {
			if viewContext.hasChanges {
				try? viewContext.save()
			}
		} catch {
			fatalError("Couldn't save context: \(error)")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
