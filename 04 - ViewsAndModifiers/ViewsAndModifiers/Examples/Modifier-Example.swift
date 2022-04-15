//
//  Modifier-Example.swift
//  ViewsAndModifiers
//
//  Created by Natasha Godwin on 4/15/22.
//

import SwiftUI

/*
 Modifier Order Matters
 
 When you add a modifier to a view, SwiftUI creates a new view with the change applied, using the generic container ModifiedContent. It doesn't simply change a property. That means that changes stack up. Each modifier adds to whatever was there before.
 
 */

struct Modifier_Example: View {
    var body: some View {
		 Text("Hello, SwiftUI!")
			.foregroundColor(.white)
			.padding()
			.background(Color.blue)
			.padding()
			.background(Color.white)
			.padding()
			.background(Color.blue)
			.padding()
			.background(Color.white)
			.padding()
			.background(Color.blue)
    }
}

struct Modifier_Example_Previews: PreviewProvider {
    static var previews: some View {
        Modifier_Example()
    }
}
