//
//  ContentView.swift
//  Bookworm
//
//  Created by Natasha Godwin on 6/16/21.
//

import SwiftUI

/*
  What is Core Data?
  Core Data is Apple's framework for reading, writing, sorting, and filtering objects in a database.

 @Binding
 A property wrapper that references and updates a @State property declared elsewhere.

 Size Classes
 Size Classes are used to tell Swift how much space is available for a view. They are written in broad terms for flexibility. In SwiftUI, there are only two size classes horizontally and vertically: compact and regular.

AnyView
A type-erased wrapper that hides (or erases) the type of view that it contains. This is useful when you need to return different views or layouts, depending on the user's device or settings.

For performance reasons, you shouldn't use AnyView often. SwiftUI works faster when it knows exactly what's in a view hierarchy.


*/



struct ContentView: View {
	 var body: some View {
		TypeErasureExample()
	 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ContentView()
		}
    }
}
