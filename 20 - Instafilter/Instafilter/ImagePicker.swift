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
1. Create a UIViewController, which in this case in UIImagePickerController
2. Create a delegate (a custom class) that will be notified any time the UIViewController changes.
3. Define a coordinator to handle the delegate class, so it can be used in SwiftUI.
4. Write a method that tells SwiftUI to use the coordinator class for the ImagePicker coordinator.
5. Give the coordinator some sort of functionality (whatever is required by the UIViewController class)
*/

struct ImagePicker: UIViewControllerRepresentable {
	 @Environment(\.presentationMode) var presentationMode
	 @Binding var image: UIImage?

	 // 1
	 func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
		  let picker = UIImagePickerController()
		  picker.delegate = context.coordinator
		  return picker
	 }

	 func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

	 }
	
	 // 2, 3
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
			
			parent.presentationMode.wrappedValue.dismiss()
		}
	}
	
	// 4
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	 
}
