//
//  EmptyView.swift
//  MatchPic
//
//  Created by Natasha Godwin on 10/2/21.
//

import SwiftUI

struct EmptyView: View {
	var body: some View {
		VStack {
			HStack {
				Image(systemName: "photo.fill")
				Text("Add photos here")
				
			}.foregroundColor(.secondary)
			Spacer()
		}.padding()
	}
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
