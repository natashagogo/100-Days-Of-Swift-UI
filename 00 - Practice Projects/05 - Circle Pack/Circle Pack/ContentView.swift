//
//  ContentView.swift
//  Circle Pack
//
//  Created by Natasha Godwin on 4/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .trailing) {
            Circle() // container
            
            HStack {
                VStack {
                    Circle()
                     .frame(width: 100, height: 100)
                     .foregroundColor(.pink)
                    HStack {
                        Circle()
                         .frame(width: 50, height: 50)
                         .foregroundColor(.pink)
                        Circle()
                         .frame(width: 25, height: 25)
                         .foregroundColor(.pink)
                        Circle()
                         .frame(width: 30, height: 30)
                         .foregroundColor(.pink)
                    }
                    Circle()
                     .frame(width: 150, height: 150)
                     .foregroundColor(.pink)
                }
                
                ZStack {
                    Circle()
                     .frame(width: 200, height: 200)
                     .foregroundColor(.white)
                    HStack {
                        Circle()
                         .frame(width: 50, height: 50)
                         .foregroundColor(.pink)
                        Circle()
                         .frame(width: 30, height: 30)
                         .foregroundColor(.pink)
                        Circle()
                         .frame(width: 45, height: 45)
                         .foregroundColor(.pink)
                    }
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
