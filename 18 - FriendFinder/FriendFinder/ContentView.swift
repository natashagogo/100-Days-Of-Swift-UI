//
//  ContentView.swift
//  FriendFinder
//
//  Created by Natasha Godwin on 7/2/21.
//

import SwiftUI

struct Friend: Codable {
    var id: String
    var name: String
}

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


struct ContentView: View {
    @State private var users = [User]()
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                HStack(alignment: .top) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text(user.name)
                        Text(user.company)
                          .foregroundColor(.secondary)
                    }
                    Spacer()
                    Text("\(user.isActive ? "Active": "Inactive")")
                        .foregroundColor(user.isActive ? Color.blue: Color.gray)
                 }
               }
                .navigationTitle("Friends")
                .onAppear(perform: loadData)
            }
       }
    
    func loadData() {
        // 1. Create the URL
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        // 2. Wrap it in a URLRequest to configure how it should be accessed
        let request = URLRequest(url: url)
        // 3. Create and start a networking task from URLRequest
        URLSession.shared.dataTask(with: request) { data, response, error in
            // 4. Handle the result
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                    // Return to main thread if the data is good
                    DispatchQueue.main.async {
                        users = decodedResponse
                    }
                    // Exit
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
