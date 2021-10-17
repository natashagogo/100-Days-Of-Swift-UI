//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/6/21.
//

import SwiftUI
import CodeScanner
import UserNotifications

struct ProspectsView: View {
	@EnvironmentObject var prospects: Prospects
	@State private var isShowingScanner = false
	@State private var isShowingSortOptions = false
	@State private var sortSelection: SortType = .none
	
	enum FilterType {
		case none
		case contacted
		case uncontacted
	}
	
	enum SortType {
		case none
		case name
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
	
	var sortedProspects: [Prospect] {
		switch sortSelection {
		   case .none:
				return filteredProspects
		   case .name:
				return filteredProspects.sorted { $0.name < $1.name }
		}
	}
	
    var body: some View {
		NavigationView {
			List {
				ForEach(filteredProspects) { prospect in
					HStack {
						VStack(alignment: .leading) {
							 Text(prospect.name)
								  .font(.headline)
							 Text(prospect.emailAddress)
								  .foregroundColor(.secondary)
						}
						Spacer()
						 if self.filter == .none {
							 if prospect.isContacted {
								 Image(systemName: "checkmark.seal.fill")
									.foregroundColor(.green)
							 }
						 }
					}
					.contextMenu {
						 Button(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted" ) {
							self.prospects.toggle(prospect)
						 }
						if !prospect.isContacted {
							Button("Remind Me") {
								self.addNotifications(for: prospect)
							}
						}
					}
				}
			}
			.navigationBarTitle(title)
			.navigationBarItems(leading: Button(action: {
				self.isShowingSortOptions = true
			}) {
				Image(systemName: "arrow.up.arrow.down.circle")
				Text("Sort")
		
			 }, trailing: Button(action: {
				self.isShowingScanner = true
			  }) {
					Image(systemName: "qrcode.viewfinder")
					Text("Scan")
			  })
			.sheet(isPresented: $isShowingScanner) {
				CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: self.handleScan)
			}
			.actionSheet(isPresented: $isShowingSortOptions) {
				 ActionSheet(title: Text("Sort By"), message: Text("Select your sorting preferences"), buttons: [
					  .default(Text("None")) { self.sortSelection = .none },
					  .default(Text("Name")) { self.sortSelection = .name },
					  .cancel()
				 ])
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
	
	func addNotifications(for prospect: Prospect) {
		let center = UNUserNotificationCenter.current()
		
		let addRequest = {
			let content = UNMutableNotificationContent()
			content.title = "Contact \(prospect.name)"
			content.subtitle = prospect.emailAddress
			content.sound = UNNotificationSound.default
			
			var dateComponents = DateComponents()
			dateComponents.hour = 9
			// This code is for testing. Uncomment the code below it for production.
			let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
			// let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeat: false)
			let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
			center.add(request)
		}
		
		center.getNotificationSettings { settings in
			 if settings.authorizationStatus == .authorized {
				  addRequest()
			 } else {
				  center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
						if success {
							 addRequest()
						} else {
							 print("D'oh")
						}
				  }
			 }
		}
	}
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
		ProspectsView(filter: .none)
    }
}
