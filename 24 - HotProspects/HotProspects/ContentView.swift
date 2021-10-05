//
//  ContentView.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/3/21.
//

import SwiftUI

/*
What is a context menu?
A list of options that appears when the user presses hard on a UI element.
You can add one to any view with the .contextMenu() modifier.

What framework should you use to send notifications to the user?
UserNotifications

What is the difference between local and push notifications?
Local notifications are scheduled locally. Remote or push notifications are sent from a server.

What is Swift Package Manager (SPM)?
SPM is a dependency manager. You can give XCode the URL of a third-party library and it will download it for you.

Which does the "Version - Up to Next Major" option mean?
It means that XCode will use the latest version of a third-party library, so long as it doesn't break your code.

What is semantic versioning (SemVer)?
This is a convention for naming software updates. It communicates the type of changes that have been made, so other developers can determine how significant the update is.
In the example "1.5.3", 1 is the major number; 5 is the minor number; and 3 is the patch number.

The patch number is used for bug fixes; the minor number is used for features that don't break any APIs; and the major number is used when the code does break APIs.



*/



struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
