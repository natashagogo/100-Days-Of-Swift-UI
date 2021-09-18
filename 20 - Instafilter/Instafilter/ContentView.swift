//
//  ContentView.swift
//  Instafilter
//
//  Created by Natasha Godwin on 9/14/21.
//

import SwiftUI

/*
What types of control flow does SwiftUI support?
SwiftUI only supports if/else statements inside of the body property.
You cannot use if let, for, while, or switch.

What happens under the hood when you use an if/else statement inside the body property?
Swift converts the statement into an internal view type called ConditionalContent, which
stores the condition and true and false views. Swift checks which one to display at run time.

This is why if let and switch statements don't work. If let creates a constant and switch statements can have a number of cases.


*/

struct ContentView: View {
	@State private var image: Image?
	@State private var filterIntensity = 0.5
	@State private var showingImagePicker = false
	@State private var inputImage: UIImage?
	 var body: some View {
		NavigationView {
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
					Slider(value: $filterIntensity)
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
		image = Image(uiImage: inputImage)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
