//
//  ContentView.swift
//  FriendFinder
//
//  Created by Natasha Godwin on 7/2/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    var body: some View {
        NavigationView {
            List(users.list, id: \.id ) { user in
                NavigationLink(destination: DetailView(user: user)) {
                    HStack(alignment: .top) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text(user.unwrappedName)
                            Text(user.unwrappedCompany)
                              .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text("\(user.unwrappedStatus ? "Active": "Inactive")")
                            .foregroundColor(user.unwrappedStatus ? Color.blue: Color.gray)
                     }
                }
              }
             .navigationTitle("Friends")
             .onAppear(perform: loadData)
            }
       }
    
    func loadData() {
           guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
               print("Invalid URL")
               return
           }

           let request = URLRequest(url: url)

           URLSession.shared.dataTask(with: request) { data, response, error in
               guard let userData = data else {
                   print("No data in response: \(error?.localizedDescription ?? "Unknown Error")")
                   return
               }

               let userDecoder = JSONDecoder()

               userDecoder.dateDecodingStrategy = .iso8601
               userDecoder.userInfo[CodingUserInfoKey.managedObjectContext] = viewContext

               do {
                   let _ = try userDecoder.decode([User].self, from: userData)

                   if viewContext.hasChanges {
                       try? viewContext.save()
                   }
               } catch {
                   print("Decoding Failed: \(error.localizedDescription)")
               }

           }.resume()
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
