//
//  MainView.swift
//  iDine
//
//  Created by Natasha Godwin on 6/23/21.
//


import SwiftUI

/*
 TO DOs:
 
 1. Prevent customers from selecting times outside of normal business hours in CheckoutView
 2. Figure out a way to send customers directly to the Order tab from ItemDetail (instead of displaying OrderView in a sheet)
 
 
 */

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
    }
}
