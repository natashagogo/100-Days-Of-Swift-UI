//
//  ContentView.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/20/21.
//

/*

What is Notification Center?
Apple's API for internal messaging, which lets the system notify you when certain events happen and lets developers post messages between different parts of code.

You can use Notification Center detect when users move apps to the background or foreground; take a screenshot; and more.

To use Notification Center, attach the onReceive() modifier to a view to catch notifications from the publisher and then take whatever action you want.

Here are some common ones:
UIApplication.willResignActiveNotification is called when the user moves an app to the background

UIApplication.willEnterForegroundNotification is called when the user moves an app to the foreground

UIApplication.userDidTakeScreenshotNotification is called when the user takes a screenshot


*/

import SwiftUI

struct ContentView: View {
    var body: some View {
		AccessibilitySettings()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
