//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/6/21.
//

import SwiftUI
import CodeScanner

struct ProspectsView: View {
	@EnvironmentObject var prospects: Prospects
	@State private var isShowingScanner = false
	
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
						.contextMenu {
							 Button(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted" ) {
								self.prospects.toggle(prospect)
							 }
						}
				 }
			}
			.navigationBarTitle(title)
			.navigationBarItems(trailing: Button(action: {
				self.isShowingScanner = true
			  }) {
					Image(systemName: "qrcode.viewfinder")
					Text("Scan")
			  })
			.sheet(isPresented: $isShowingScanner) {
				CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: self.handleScan)
			}
		}
    }
	
	func handleScan(result: Result<String, CodeScannerView.ScanError>) {
		self.isShowingScanner = false
		switch result {
		case .success(let code):
			 let details = code.components(separatedBy: "\n")
			 guard details.count == 2 else { return }

			 let person = Prospect()
			 person.name = details[0]
			 person.emailAddress = details[1]

			self.prospects.add(person)
		case .failure(let error):
			 print("Scanning failed")
		}
	}
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
		ProspectsView(filter: .none)
    }
}
