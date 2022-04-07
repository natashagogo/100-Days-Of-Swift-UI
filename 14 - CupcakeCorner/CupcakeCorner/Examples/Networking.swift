//
//  Networking.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 7/28/21.
//

import SwiftUI

/*
  
How to use networking in an app
1. Look at how the data is structured and create Swift objects that match it.
2. Write a function that ...
	 a. creates the URL
	 b. wraps it in a URLRequest, which lets you specify how it is loaded
	 c. uses that URLRequest to create and start a networking task
	 d. Handle the result and send it from the background to the main thread with DispatchQueue.main.async()

*/

struct Result: Codable {
	var trackId: Int
	var trackName: String
	var collectionName: String
}

struct Response: Codable {
	var results: [Result]
}

struct Networking: View {
	@State private var results = [Result]()
	 var body: some View {
		List(results, id: \.trackId) { item in
			VStack(alignment: .leading) {
				Text(item.trackName)
					.font(.headline)
				Text(item.collectionName)
			}.onAppear(perform: loadData)
		}
	 }
	
	func loadData() {
		// 1.
		guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
			print("Invalid URL.")
			return
		}
		
		// 2.
		let request = URLRequest(url: url)
		
		// 3.
		URLSession.shared.dataTask(with: request) { data, response, error in
			if let data = data {
				if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
					// Go to the main thread, if the data is good
					DispatchQueue.main.async {
						// Update the UI
						self.results = decodedResponse.results
					}
					// Exit
					return
				}
			}
			// If there was a problem, print this message.
			print("Fetch failed: \(error?.localizedDescription ?? "Unknown Error")")
		}.resume()
	}
}

struct Networking_Previews: PreviewProvider {
    static var previews: some View {
        Networking()
    }
}
