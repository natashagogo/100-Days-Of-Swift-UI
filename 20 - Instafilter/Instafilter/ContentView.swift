//
//  ContentView.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/14/21.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

/*
Quote of the Day

“Don’t worry if it doesn’t work right – if everything did, you’d be out of a job.” - Mosher’s Law of Software Engineering

 What is CIFilter?
 A Core Image class that contains filters.
 Each filter is an object that conforms to a protocol, e.g. CISepiaTone.
 Under the hood, these protocols are calls to setValue(:_forKey:).

How do you get UIImageWriteToSavedPhotosAlbum() to work in SwiftUI?
Create a new class that ...
- inherits from NSObject
- has a method that calls UIImageWriteToSavedPhotosAlbum()

class ImageSaver: NSObject {
	func writeToPhotoAlbum(image: UIImage) {
		UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
	}
	
	@objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
		// save complete
	}
}

How do you request photo saving permission?
Open Info.plist
Right-click in some blank space
Choose Add Row
Select “Privacy - Photo Library Additions Usage Description” for the key name.
Enter “We want to save the filtered photo.” as the value


*/



struct ContentView: View {
	@State private var image: Image?
	@State private var processedImage: UIImage?
	@State private var filterIntensity = 0.5
	@State private var showingImagePicker = false
	@State private var inputImage: UIImage?
	@State private var currentFilter: CIFilter = CIFilter.sepiaTone()
	@State private var showingFilterSheet = false
	
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
						.fill(Color.white)
						.border(Color.gray, width: 0.5)
					// display the image
					if image != nil {
						image?
							.resizable()
							.scaledToFit()
					} else {
						HStack(spacing: 5) {
							Image(systemName: "photo.fill")
							Text("Tap to select picture")
						}
						.foregroundColor(.secondary)
						.font(.headline)
					}
				}
				.onTapGesture {
					self.showingImagePicker = true
				}
				
				HStack {
					Text("Intensity")
					Slider(value: intensity)
				}.padding(.vertical)
				
				HStack {
					Button("Change Filter") {
						// change filter
						self.showingFilterSheet = true
					}
					
					Spacer()
					
					Button("Save") {
						// save the picture
						guard let processedImage = self.processedImage else { return }
						
						let imageSaver = ImageSaver()
						imageSaver.successHandler = {
							print("Success!")
						}
						imageSaver.errorHandler = {
							print("Oops! \($0.localizedDescription)")
						}
						imageSaver.writeToPhotoAlbum(image: processedImage)
					}
				}
			}
			.padding([.horizontal, .bottom])
			.navigationBarTitle("Instafilter")
			.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
				ImagePicker(image: self.$inputImage)
			}
			.actionSheet(isPresented: $showingFilterSheet) {
				ActionSheet(title: Text("Select a filter"), buttons: [
					.default(Text("Crystallize")) { self.setFilter(CIFilter.crystallize()) },
					 .default(Text("Edges")) { self.setFilter(CIFilter.edges()) },
					 .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur()) },
					 .default(Text("Pixellate")) { self.setFilter(CIFilter.pixellate()) },
					 .default(Text("Sepia Tone")) { self.setFilter(CIFilter.sepiaTone()) },
					 .default(Text("Unsharp Mask")) { self.setFilter(CIFilter.unsharpMask()) },
					 .default(Text("Vignette")) { self.setFilter(CIFilter.vignette()) },
					 .cancel()
				])
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
	
	func setFilter(_ filter: CIFilter) {
		currentFilter = filter
		loadImage()
	}
	
	// Process the image
	func applyProcessing() {
		// update the filter's properties, e.g. intensity, radius, etc.
		let inputKeys = currentFilter.inputKeys
		if inputKeys.contains(kCIInputIntensityKey) {currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)}
		if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
		if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
	
		
		// read the output image from the filter
		guard let outputImage = currentFilter.outputImage else { return }
		
		// ask the CIContext to render it
		if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
			// place the result into the image property
			let uiImage = UIImage(cgImage: cgimg)
			image = Image(uiImage: uiImage)
			processedImage = uiImage
		}
		
	}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
