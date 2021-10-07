//
//  MeView.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/6/21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins // get all Core Image filters


struct MeView: View {
	@State private var name = "Anonymous"
	@State private var emailAddress = "you@yoursite.com"
	
	let context = CIContext()
	let filter = CIFilter.qrCodeGenerator()
	
    var body: some View {
		NavigationView {
			 VStack {
				  TextField("Name", text: $name)
						.textContentType(.name)
						.font(.title)
						.padding(.horizontal)
					   .textFieldStyle(RoundedBorderTextFieldStyle())

				  TextField("Email address", text: $emailAddress)
						.textContentType(.emailAddress)
						.font(.title)
						.padding([.horizontal, .bottom])
					   .textFieldStyle(RoundedBorderTextFieldStyle())
					   .autocapitalization(.none)
				
				
				// QR Code
				Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
					.interpolation(.none)
					.resizable()
					.scaledToFit()
					.frame(width: 200, height: 200)
			
				  Spacer()
			 }
			 .navigationBarTitle("Your code")
		}
    }
	
	func generateQRCode(from string: String) -> UIImage {
		 let data = Data(string.utf8) // convert data to a string
		 filter.setValue(data, forKey: "inputMessage")

		 if let outputImage = filter.outputImage {
			// Convert the CIImage to a CGImage
			  if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
				// Convert the CGImage to a UIImage
					return UIImage(cgImage: cgimg)
			  }
		 }
		
		// If this fails, return this SFSymbol
		 return UIImage(systemName: "xmark.circle") ?? UIImage()
	}
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
