//
//  ContentView.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/14/21.
//

import SwiftUI

/*
 UIKit 101

 All views inherit from the parent class UIView. In other words, views are classes, not structs.
 Views are controlled with UIViewController, which has many subclasses views can work with.
 UIKit uses a design pattern called delegation to decide where work happens.

 How do you get UIKit to work in SwiftUI?
 1. Create a struct that conforms to the UIViewControllerRepresentable protocol.
 2. Implement these methods: makeUIViewController() and updateUIViewController()

 Here is an example:
	struct ImagePicker: UIViewControllerRepresentable {
		
		func makeUIViewController(context: Context) -> UIImagePickerController {
			let picker = UIImagePickerController()
			return picker
		}
		
		func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
		
		}
		
		typealias UIViewControllerType = UIImagePickerController

	}

  Once the controller is wrapped, it can be used like any other SwiftUI view.


*/

struct ContentView: View {
	 @State private var image: Image?
	 @State private var showingImagePicker = false

	 var body: some View {
		  VStack {
				image?
					 .resizable()
					 .scaledToFit()

				Button("Select Image") {
					self.showingImagePicker = true
				}
		  }
		  .sheet(isPresented: $showingImagePicker) {
				ImagePicker()
		  }
	 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
