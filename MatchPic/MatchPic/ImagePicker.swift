//
//  ImagePicker.swift
//  MatchPic
//
//  Created by Natasha Godwin on 10/2/21.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
	@Environment(\.presentationMode) var presentationMode
	@Binding var image: UIImage?
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
		let picker = UIImagePickerController()
		picker.delegate = context.coordinator
		return picker
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
		// empty for now
	}
	
	class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		let parent: ImagePicker
		
		init(_ parent: ImagePicker) {
			self.parent = parent
		}
		
		// When the user selects an image, get information about it
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			if let selectedImage = info[.originalImage] as? UIImage {
				parent.image = selectedImage
			}
			// Dismiss the view
			parent.presentationMode.wrappedValue.dismiss()
		}
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
}
