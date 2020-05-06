//
//  ContentView.swift
//  Moonshot
//
//  Created by Natasha Godwin on 5/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
             }.navigationBarTitle("List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
