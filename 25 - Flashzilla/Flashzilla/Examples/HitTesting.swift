//
//  HitTesting.swift
//  Flashzilla
//
//  Created by Natasha Godwin on 10/20/21.
//

import SwiftUI

struct HitTesting: View {
    var body: some View {
		VStack {
			 Text("Hello")
			 Spacer().frame(height: 100)
			 Text("World")
		}
		.contentShape(Rectangle()) // This will make the entire VStack tappable, including the spacer
		.onTapGesture {
			 print("VStack tapped!")
		}
    }
}

struct HitTesting_Previews: PreviewProvider {
    static var previews: some View {
        HitTesting()
    }
}
