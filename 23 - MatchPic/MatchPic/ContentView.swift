//
//  ContentView.swift
//  MatchPic
//
//  Created by Natasha Godwin on 10/2/21.
//

/*
Project Overview
This app lets users ...
- import photos from the photo library
- name each photo
- see their collection in a list
- see larger versions of each photo in a DetailView

Checklist
✅ Wrap UIImagePickerController so it can be used to select photos.
- Detect when a new photo is imported, and immediately ask the user to name the photo.
- Save that name and photo somewhere safe.
- Show all names and photos in a list, sorted by name.
- Create a detail screen that shows a picture full size.
- Save all changes, using either Core Data or the iOS file system

Notes
Saving images in Core Data is bad for performance. Instead, generate a new UUID() for the image filename, write that to the documents directory, and store the UUID in the data model.

*/

import SwiftUI
import UIKit

struct ContentView: View {
	@State private var photos = [Photo]()
	@State private var newPhoto: Image?
	@State private var showingImagePicker = false
	@State private var selectedPhoto: UIImage?
    var body: some View {
		NavigationView {
			VStack {
				if photos.isEmpty {
					EmptyView()
				} else {
					newPhoto?
						.resizable()
						.scaledToFit()
				}
			}
			.navigationTitle("MatchPic")
			.navigationBarItems(trailing: Button("Add") {
				showingImagePicker.toggle()
			})
			.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
				ImagePicker(image: $selectedPhoto)
			}
		}
    }
	
	func loadImage() {
		guard let selectedPhoto = selectedPhoto else { return }
		newPhoto = Image(uiImage: selectedPhoto)
		
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


