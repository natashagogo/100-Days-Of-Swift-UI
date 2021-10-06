//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/6/21.
//

import SwiftUI

struct ProspectsView: View {
	@EnvironmentObject var prospects: Prospects
	enum FilterType {
		case none
		case contacted
		case uncontacted
	}
	
	let filter: FilterType
	
	var title: String {
		switch filter {
		case .none:
			return "Everyone"
		case .contacted:
			return "Contacts"
		case .uncontacted:
			return "Prospects"
		}
	}
	
	/*
	 Because of the way the data is set up, SwiftUI will reinvoke the body property every time a change is made - which will, in turn, re-calculate this computed property.
	*/
	var filteredProspects: [Prospect] {
		switch filter {
		case .none:
			return prospects.people
		case .contacted:
			return prospects.people.filter { $0.isContacted }
		case .uncontacted:
			return prospects.people.filter { !$0.isContacted }
		}
	}
	
    var body: some View {
		NavigationView {
			List {
				 ForEach(filteredProspects) { prospect in
					  VStack(alignment: .leading) {
						   Text(prospect.name)
								 .font(.headline)
							Text(prospect.emailAddress)
								 .foregroundColor(.secondary)
					  }
				 }
			}
			.navigationBarTitle(title)
			.navigationBarItems(trailing: Button(action: {
					let prospect = Prospect()
					prospect.name = "Paul Hudson"
					prospect.emailAddress = "paul@hackingwithswift.com"
					self.prospects.people.append(prospect)
			  }) {
					Image(systemName: "qrcode.viewfinder")
					Text("Scan")
			  })
		}
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
		ProspectsView(filter: .none)
    }
}
