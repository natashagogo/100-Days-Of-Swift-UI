//
//  ContentView.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/1/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct CustomView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "sun.min.fill")
                .foregroundColor(.blue)
                .frame(width: 20, height: 20)
            ZStack {
                Rectangle()
                 .fill(Color.gray)
                 .frame(width: 310, height: 150)
                 .cornerRadius(10)
                Text("Timeline Event")
                  .foregroundColor(.white)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 15) {
                    ForEach(0..<100) {_ in
                        NavigationLink(destination: Text("Event Detail View")) {
                            CustomView()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .navigationBarTitle("Timeline")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

