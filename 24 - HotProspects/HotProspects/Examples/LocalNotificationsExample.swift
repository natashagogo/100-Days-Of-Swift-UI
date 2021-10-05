//
//  LocalNotificationsExample.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/5/21.
//

import SwiftUI
import UserNotifications

struct LocalNotificationsExample: View {
    var body: some View {
		VStack {
			Button("Request Permission") {
				UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
					 if success {
						  print("All set!")
					 } else if let error = error {
						  print(error.localizedDescription)
					 }
				}
			}
			
			Button("Schedule Notifications") {
				let content = UNMutableNotificationContent()
				content.title = "Prep for appointment"
				content.subtitle = "Write down three questions."
				content.sound = UNNotificationSound.default

				// show this notification five seconds from now
				let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

				// choose a random identifier
				let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

				// add our notification request
				UNUserNotificationCenter.current().add(request)
			}
		}
    }
}

struct LocalNotificationsExample_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationsExample()
    }
}
