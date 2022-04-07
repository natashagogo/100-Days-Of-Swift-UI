//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/18/21.
//

import SwiftUI
import UIKit

/*
In order to use UIKit in this application, we need to ...
1. Create a SwiftUI struct that wraps a UIViewController, such as UIImagePickerController
   This struct should conform to the UIViewControllerRepresentable protocol and have two methods:
   - makeUIViewController()
   - updateUIViewController()
   Only the first one, which creates the UIViewController, needs to be implemented
   When an instance of the struct is created, Swift automatically calls this method to create the UIViewController.
2. Create a coordinator class inside the SwiftUI struct.
   This class acts as a delegate for the UIViewController, receiving notifications any time it changes.
	It belongs to the SwiftUI struct and passes any relevant information back up to it when needed.
   Because of that, the coordinator class should conform to NSObject, the base class for most types in UIKit, along with any delegate protocols that are required for the UIViewController you're using.
3. Make the coordinator class the delegate of the UIViewController in the makeUIViewController() method.
4. Implement the makeCoordinator() method.
   This method lets you control how a coordinator is made.
   At a minimum, you should tell Swift to use the coordinator class for the SwiftUI struct's coordinator.
5. Give the coordinator some sort of functionality (whatever is required by the UIViewController class)

*/

struct ImagePicker: UIViewControllerRepresentable {
	 @Environment(\.presentationMode) var presentationMode
	 @Binding var image: UIImage?

	 // 1
	 func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
		  let picker = UIImagePickerController()
		  picker.delegate = context.coordinator //  3
		  return picker
	 }

	 func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

	 }
	
	 // 2
	class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		let parent: ImagePicker
		
		init(_ parent: ImagePicker) {
			self.parent = parent
		}
		
		// When the user selects an image, get information about it
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			if let uiImage = info[.originalImage] as? UIImage {
				parent.image = uiImage
			}
			// Then dismiss the view 
			parent.presentationMode.wrappedValue.dismiss()
		}
	}
	
	// 4
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	 
}
