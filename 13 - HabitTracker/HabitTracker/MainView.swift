//
//  ContentView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/11/21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var habits: Habits
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Label("List", systemImage: "list.star")
                }
            ProgressView()
                .tabItem {
                    Label("Progress", systemImage: "chart.bar.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Habits())
    }
}
