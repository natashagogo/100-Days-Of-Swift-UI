//
//  Custom-Modifier.swift
//  ViewsAndModifiers
//
//  Created by Natasha Godwin on 4/15/22.
//

import SwiftUI

struct Title: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.white)
			.padding()
			.background(.blue)
			.clipShape(RoundedRectangle(cornerRadius: 15.0))
	}
}

extension View {
	func titleStyle() -> some View {
		modifier(Title())
	}
}

import SwiftUI

struct Custom_Modifier: View {
	 var body: some View {
		  Text("Hello, SwiftUI!")
			 .titleStyle()
	 }
}

struct Custom_Modifier_Previews: PreviewProvider {
    static var previews: some View {
        Custom_Modifier()
    }
}
