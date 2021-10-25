//
//  Settings.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/25/21.
//

import SwiftUI

struct Settings: View {
	@State private var reviewWrongCards = false
	@Environment(\.presentationMode) var presentationMode
    var body: some View {
		NavigationView {
			Form {
				Toggle("Review cards you got incorrect?", isOn: $reviewWrongCards)
			}
			.navigationTitle("Settings")
			.navigationBarItems(trailing: Button("Done") {
				self.presentationMode.wrappedValue.dismiss()
			})
		}
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
