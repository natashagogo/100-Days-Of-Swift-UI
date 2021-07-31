//
//  TypeErasureExample.swift
//  Bookworm
//
//  Created by Natasha Godwin on 7/31/21.
//

import SwiftUI

struct TypeErasureExample: View {
	@Environment(\.horizontalSizeClass) var horizontalSizeClass
	var body: some View {
		if horizontalSizeClass == .compact {
			return AnyView(VStack {
				Text("Active size class:")
					.font(.headline)
				Text("Compact")
					.font(.largeTitle)
					.textCase(.uppercase)
			})
		} else {
			return AnyView(HStack {
				Text("Active size class:")
					.font(.headline)
				Text("Regular")
					.font(.largeTitle)
					.textCase(.uppercase)
			})
		}
	}
}

struct TypeErasureExample_Previews: PreviewProvider {
    static var previews: some View {
        TypeErasureExample()
    }
}
