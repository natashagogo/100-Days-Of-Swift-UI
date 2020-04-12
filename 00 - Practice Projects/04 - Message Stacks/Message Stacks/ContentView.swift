//
//  ContentView.swift
//  Message Stacks
//
//  Created by Natasha Godwin on 4/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

// TO DO
// Learn how to create custom shapes to create a more attractive message UI.
// Create custom modifiers ?


struct Message: View {
    var profilePic: String
    var message: String
    var isUser: Bool = false
    
    var body: some View {
        ZStack(alignment: isUser ? .leading : .trailing) {
            isUser ? Color.blue : Color.white
            HStack {
                Image(systemName: profilePic)
                Text(message)
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
        .font(isUser ? .body : .title)
        .foregroundColor(isUser ? Color.white : Color.blue)
        .frame(width: 350, height: 100)
    }
}


struct MessageHistory: View {
    var body: some View {
        VStack {
            Message(profilePic: "globe", message: "Hello, Natasha!", isUser: true)
            Message(profilePic: "person.fill", message: "Hello, World!", isUser: false)
            Spacer()
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 220/255, green: 220/255, blue: 230/255)
                .edgesIgnoringSafeArea(.all)
            MessageHistory()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
