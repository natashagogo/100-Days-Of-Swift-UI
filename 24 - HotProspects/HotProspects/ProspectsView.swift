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
	
    var body: some View {
		NavigationView {
			Text("List")
				.navigationBarTitle(title)
		}
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
		ProspectsView(filter: .none)
    }
}
