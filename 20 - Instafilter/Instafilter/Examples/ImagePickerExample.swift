//
//  ImagePickerExample.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/16/21.
//

import SwiftUI

struct ImagePickerExample: View {
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
		// Save the image
		let imageSaver = ImageSaver()
		imageSaver.writeToPhotoAlbum(image: inputImage)
	}
}




struct ImagePickerExample_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerExample()
    }
}
