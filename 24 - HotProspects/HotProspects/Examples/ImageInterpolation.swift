//
//  ImageInterpolation.swift
//  HotProspects
//
//  Created by Natasha Godwin on 10/4/21.
//

import SwiftUI

struct ImageInterpolation: View {
    var body: some View {
		Image("example")
			 .interpolation(.none) 
			 .resizable()
			 .scaledToFit()
			 .frame(maxHeight: .infinity)
			 .background(Color.black)
			 .edgesIgnoringSafeArea(.all)
    }
}

struct ImageInterpolation_Previews: PreviewProvider {
    static var previews: some View {
        ImageInterpolation()
    }
}
