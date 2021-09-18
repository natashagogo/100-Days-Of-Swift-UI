//
//  ContentView.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/14/21.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins



struct ContentView: View {
	@State private var image: Image?
	@State private var filterIntensity = 0.5
	@State private var showingImagePicker = false
	@State private var inputImage: UIImage?
	@State private var currentFilter = CIFilter.sepiaTone()
	let context = CIContext()
	 var body: some View {
		// Monitor filterIntensity for changes and call applyProcessing() when one is made
		let intensity = Binding<Double>(
			get: {
				self.filterIntensity
			},
			set: {
				self.filterIntensity = $0
				self.applyProcessing()
			}
		)
		return NavigationView {
			VStack {
				ZStack {
					Rectangle()
						.fill(Color.secondary)
					// display the image
					if image != nil {
						image?
							.resizable()
							.scaledToFit()
					} else {
						Text("Tap to select picture")
							.foregroundColor(.white)
							.font(.headline)
					}
				}
				.onTapGesture {
					showingImagePicker = true
				}
				
				HStack {
					Text("Intensity")
					Slider(value: intensity)
				}.padding(.vertical)
				
				HStack {
					Button("Change Filter") {
						// change filter
					}
					
					Spacer()
					
					Button("Save") {
						// save the picture
					}
				}
			}
			.padding([.horizontal, .bottom])
			.navigationBarTitle("Instafilter")
			.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
				ImagePicker(image: self.$inputImage)
			}
		}
	 }
	
	func loadImage() {
		guard let inputImage = inputImage else { return }
		// Get the filtered image
		let beginImage = CIImage(image: inputImage)
		currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
		applyProcessing()
	}
	
	// Process the image
	func applyProcessing() {
		// set the filter's intensity
		currentFilter.intensity = Float(filterIntensity)
		
		// read the output image from the filter
		guard let outputImage = currentFilter.outputImage else { return }
		
		// ask the CIContext to render it
		if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
			// place the result into the image property
			let uiImage = UIImage(cgImage: cgimg)
			image = Image(uiImage: uiImage)
		}
		
	}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
