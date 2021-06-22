//
//  iDineApp.swift
//  iDine
//
//  Created by Natasha Godwin on 6/22/21.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
