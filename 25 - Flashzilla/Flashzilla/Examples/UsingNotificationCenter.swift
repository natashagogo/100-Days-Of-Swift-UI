//
//  UsingNotificationCenter.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/20/21.
//

import SwiftUI

struct UsingNotificationCenter: View {
    var body: some View {
		Text("Hello, World!")
			.onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
				 print("Moving to the background!")
			}
			.onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
					  print("Moving back to the foreground!")
				 }
			.onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
					  print("User took a screenshot!")
				 }
    }
}

struct UsingNotificationCenter_Previews: PreviewProvider {
    static var previews: some View {
        UsingNotificationCenter()
    }
}
