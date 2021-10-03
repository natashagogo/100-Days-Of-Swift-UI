//
//  TabViewExample.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/3/21.
//

import SwiftUI


struct Notes: View {
	var body: some View {
		NavigationView {
			List {
				
			}
			.navigationTitle("Notes")
	  }
   }
}

struct Canvas: View {
	var body: some View {
		NavigationView {
			  VStack {
				
			}
			.navigationTitle("Canvas")
		}
	}
}

struct Dashboard: View {
	var body: some View {
		NavigationView {
			VStack {
			}
			.navigationTitle("Dashboard")
		}
	}
}

struct TabViewExample: View {
    var body: some View {
		TabView {
			Notes()
				.tabItem {
					Image(systemName: "note.text")
					Text("Notes")
				}
			Canvas()
				.tabItem {
					Image(systemName: "scribble")
					Text("Canvas")
				}
			Dashboard()
				.tabItem {
					Image(systemName: "chart.bar.xaxis")
					Text("Dashboard")
				}
		}
    }
}

struct TabViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TabViewExample()
    }
}
