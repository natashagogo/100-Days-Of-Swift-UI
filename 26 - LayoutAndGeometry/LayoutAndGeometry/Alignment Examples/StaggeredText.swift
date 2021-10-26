//
//  StaggeredText.swift
//  LayoutAndGeometry
//
//  Created by Natasha Godwin on 10/26/21.
//

import SwiftUI

struct StaggeredText: View {
	var body: some View {
	  VStack(alignment: .leading) {
		  ForEach(0..<10) { position in
			 Text("Hello")
				  .font(.title)
				  .alignmentGuide(.leading) { _ in CGFloat(position) * -15}
				 .background(Color.white)
		  }
	  }
	  .frame(width: 300, height: 300)
	  .background(Color.black)
	}
}

struct StaggeredText_Previews: PreviewProvider {
    static var previews: some View {
        StaggeredText()
    }
}
