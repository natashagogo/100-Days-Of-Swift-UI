//
//  ManualTabViewExample.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/3/21.
//

import SwiftUI

struct ManualTabViewExample: View {
	@State private var selectedTab = "notes"
	
    var body: some View {
		TabView(selection: $selectedTab) {
			Text("Notes")
				.onTapGesture {
					selectedTab = "canvas"
				}
				.tabItem {
					Image(systemName: "note.text")
					Text("Notes")
				}
				.tag("notes")
			Text("Canvas")
				.onTapGesture {
					selectedTab = "dashboard"
				}
				.tabItem {
					Image(systemName: "scribble")
					Text("Canvas")
				}
				.tag("canvas")
			Text("Dashboard")
				.onTapGesture {
					selectedTab = "notes"
				}
				.tabItem {
					Image(systemName: "chart.bar.xaxis")
					Text("Dashboard")
				}
				.tag("dashboard")
		}
    }
}

struct ManualTabViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ManualTabViewExample()
    }
}
