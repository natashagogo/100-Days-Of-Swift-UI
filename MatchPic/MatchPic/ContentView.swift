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
- Wrap UIImagePickerController so it can be used to select photos.
- Detect when a new photo is imported, and immediately ask the user to name the photo.
- Save that name and photo somewhere safe.
- Show all names and photos in a list, sorted by name.
- Create a detail screen that shows a picture full size.
- Save all changes, using either Core Data or the iOS file system

Notes
Saving images in Core Data is bad for performance. Instead, generate a new UUID() for the image filename, write that to the documents directory, and store the UUID in the data model.

*/

import SwiftUI

struct ContentView: View {
	@State private var photos = [Photo]()
    var body: some View {
		NavigationView {
			Group {
				if photos.isEmpty {
					EmptyView()
				} else {
					List {
						ForEach(photos) { photo in
							Image(photo.name)
						}
					}
				}
			}.navigationTitle("MatchPic")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


