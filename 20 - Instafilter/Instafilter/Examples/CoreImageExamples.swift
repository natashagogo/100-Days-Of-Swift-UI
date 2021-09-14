//
//  ContentView.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/13/21.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

/*
  Notes

  What is CoreImage?
  Apple's framework for manipulating images.
  Behind the scenes, it's a stringly typed API.

  When should you use Core Image?
  1. Create images dynamically
  2. Apply filters to them
  3. Save them to the user's photo library

  There are four image types you can work with:
  1. Image()
  2. UIImage() - comes from UIKit
  3. CGImage - comes from Core Graphics, a two-dimensional array of pixels
  4. CIImage - comes from Core Image, stores all the information required to produce an image, but doesn't turn it into pixels unless asked; it's an "image recipe"
 
  There is some interoperability between these types. Examples:
  UIImage and CGImage have a two-way relationship. You can use one to make the other.
  UIImage and CGImage can both be used to create a CIImage.
  A CIImage can be used to make a CGImage
  CGImage and UIImage can be used to make an Image.

 Note that UIImage, CGImage, and CIImage are pure data.
 They can't be presented in a SwiftUI view until they are manipulated and converted into an Image.
  
 How do you get Image and Core Image to work together?
 1. Load the image into UIImage(named:)
 2. Convert it into CIImage
 3. Create a Core Image context
 4. Create a Core Image filter
 5. Convert the output of the filter into an image by ...
		A. reading the output image from our filter, which will be an optional CIImage.
      B. asking our context to create a CGImage from that output image (written as an optional)
      C. Convert that CGImage into a UIImage.
      D. Convert that UIImage into a SwiftUI Image.


  
*/

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
