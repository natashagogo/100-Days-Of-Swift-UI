//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/14/21.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
	
	func makeUIViewController(context: Context) -> UIImagePickerController {
		let picker = UIImagePickerController()
		return picker
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
	
	}
	
	typealias UIViewControllerType = UIImagePickerController

}
