//
//  ContentView.swift
//  iExpense
//
//  Created by Natasha Godwin on 5/1/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
}


struct ContentView: View {
    @ObservedObject var user = User()
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Last name", text: $user.lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
