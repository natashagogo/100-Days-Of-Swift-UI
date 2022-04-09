//
//  NumberView.swift
//  WeSplit
//
//  Created by Natasha Godwin on 4/9/22.
//

import SwiftUI

// TO DO
// This would be more reusable, if it were able to accept any number. Use the Numeric protocol?
struct NumberView: View {
	var number: Double
	var label: String
	var body: some View {
		VStack {
			Text(number, format: .currency(code: Locale.current.currencyCode ?? "USD"))
				.font(.largeTitle)
			Text(label)
				.font(.subheadline)
		}
		.padding()
	}
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
		 NumberView(number: 50.00, label: "Total")
    }
}
