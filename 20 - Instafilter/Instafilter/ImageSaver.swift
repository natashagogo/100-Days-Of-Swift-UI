//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/19/21.
//

import UIKit

class ImageSaver: NSObject {
	var successHandler: (() -> Void)?
	var errorHandler: ((Error) -> Void)?
	
	func writeToPhotoAlbum(image: UIImage) {
		UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
	}
	
	@objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
		// save complete
		if let error = error {
			errorHandler?(error)
		} else {
			successHandler?()
		}
	}
}
