//
//  ContentView.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/14/21.
//

import SwiftUI

/*
Notes

UIKit

What is a delegate?
An object that responds to an event that occurs elsewhere.

Examples:
- In UIKit, you can attach a delegate object to any view, which lets you modify its behavior without creating a separate custom view.
- In SwiftUI, you can use coordinators to act as delegates to UIKit view controllers. 

SwiftUI Coordinators
Delegates for UIKit view controllers.



*/


struct ContentView: View {
	@State private var image: Image?
	@State private var showingImagePicker = false
	@State private var inputImage: UIImage?

	 var body: some View {
		  VStack {
				image?
					 .resizable()
					 .scaledToFit()

				Button("Select Image") {
					self.showingImagePicker = true
				}
		  }
		  .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
			ImagePicker(image: self.$inputImage)
		  }
	 }
	
	func loadImage() {
		 guard let inputImage = inputImage else { return }
		 image = Image(uiImage: inputImage)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
