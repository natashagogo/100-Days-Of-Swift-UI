//
//  Form.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 7/28/21.
//

import SwiftUI

struct FormValidation: View {
	@State private var name = ""
	@State private var email = ""
	
	var disableForm: Bool {
		name.isEmpty || name.count < 2 || email.isEmpty || !email.contains("@")
	}
    var body: some View {
		Form {
			Section {
				TextField("Name", text: $name)
				TextField("Email", text: $email)
					.autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
			}
			Button("Submit") {}
				.disabled(disableForm)
		}
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        FormValidation()
    }
}
