//
//  ContentView.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/13/21.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins



struct CoreImageExamples: View {
	@State private var image: Image?
	 var body: some View {
		VStack {
			image?
				.resizable()
				.scaledToFit()
		}.onAppear(perform: sepiaImage)
	 }
	
	func swirlImage() {
		// Load image into UIImage
		guard let inputImage = UIImage(named: "Example") else { return }
		// Convert it into a CIImage
		let beginImage = CIImage(image: inputImage)
		// Create a Core Image context
		let context = CIContext()
		// Create a Core Image filter
		guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
		currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
		currentFilter.setValue(2000, forKey: kCIInputRadiusKey)
		currentFilter.setValue(CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2), forKey: kCIInputCenterKey)
		
		// Convert the output of the filter into an Image
		// get a CIImage from our filter or exit if that fails
		guard let outputImage = currentFilter.outputImage else { return }
		// Attempt to get a CGImage from our CIImage
		if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
			 // convert that to a UIImage
			 let uiImage = UIImage(cgImage: cgimg)

			 // and convert that to a SwiftUI image
			 image = Image(uiImage: uiImage)
		}
		
	}
	
	func pixellateImage() {
		guard let inputImage = UIImage(named: "Example") else { return }
		let beginImage = CIImage(image: inputImage)
		let context = CIContext()
		
		// Create a Core Image filter
		let currentFilter = CIFilter.pixellate()
		currentFilter.inputImage = beginImage
		currentFilter.scale = 100
		
		guard let outputImage = currentFilter.outputImage else { return }
		if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
			 let uiImage = UIImage(cgImage: cgimg)
			 image = Image(uiImage: uiImage)
		}
		
	}
	
	func crystallizeImage() {
		guard let inputImage = UIImage(named: "Example") else { return }
		let beginImage = CIImage(image: inputImage)
		let context = CIContext()
		
		// Create a Core Image filter
		let currentFilter = CIFilter.crystallize()
		currentFilter.inputImage = beginImage
		currentFilter.radius = 200
		
		guard let outputImage = currentFilter.outputImage else { return }
		if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
			 let uiImage = UIImage(cgImage: cgimg)
			 image = Image(uiImage: uiImage)
		}
	}
	
	func sepiaImage() {
		guard let inputImage = UIImage(named: "Example") else { return }
		let beginImage = CIImage(image: inputImage)
		let context = CIContext()
		
		// Create a Core Image filter
		let currentFilter = CIFilter.sepiaTone()
		currentFilter.inputImage = beginImage
		currentFilter.intensity = 1
		
		guard let outputImage = currentFilter.outputImage else { return }
		if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
			 let uiImage = UIImage(cgImage: cgimg)
			 image = Image(uiImage: uiImage)
	}
 }
	
}

struct CoreImageExamples_Previews: PreviewProvider {
    static var previews: some View {
        CoreImageExamples()
    }
}
