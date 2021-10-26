//
//  OffsetText.swift
//  LayoutAndGeometry
//
//  Created by Natasha Godwin on 10/26/21.
//

import SwiftUI

struct OffSetText: View {
	var body: some View {
		Text("Live long and prosper.")
			.background(Color.white)
			.offset(x: 20.0, y: 50.0)
			.frame(width: 300, height: 300, alignment: .topLeading)
			.background(Color.blue)
	}
}

struct OffsetText_Previews: PreviewProvider {
    static var previews: some View {
        OffSetText()
    }
}
