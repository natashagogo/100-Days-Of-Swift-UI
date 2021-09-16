//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/14/21.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
	@Binding var image: UIImage?
	@Environment(\.presentationMode) var presentationMode
	
	// Create a delegate for the UIKit view controller
	class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
		var parent: ImagePicker // to get information about the image and presentation mode directly
		init(_ parent: ImagePicker) {
			self.parent = parent
		}
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			// Find the image that was selected and assign it to the parent
			if let uiImage = info[.originalImage] as? UIImage {
				parent.image = uiImage
			}
			
			// Dismiss the picker
			parent.presentationMode.wrappedValue.dismiss()
			
		}
	}
	
	// Create and configure an instance of the Coordinator class
	// Note that this is called automatically when an instance of ImagePicker is created
	func makeCoordinator() -> Coordinator {
		Coordinator(self) // pass the ImagePicker struct into the coordinator
	}
	
	// Create an image picker
	func makeUIViewController(context: Context) -> UIImagePickerController {
		let picker = UIImagePickerController()
		picker.delegate = context.coordinator // when something happens, tell the coordinator
		return picker
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
		
	}
	
	typealias UIViewControllerType = UIImagePickerController

}
