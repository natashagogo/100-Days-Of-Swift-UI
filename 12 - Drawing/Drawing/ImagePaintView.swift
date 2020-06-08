//
//  ImagePaintView.swift
//  Drawing
//
//  Created by Natasha Godwin on 6/7/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        ZStack {
            Text("Hello, World")
              .foregroundColor(.purple)
            Capsule()
                .strokeBorder(ImagePaint(image: Image("pattern"), scale: 0.1), lineWidth: 20)
              .frame(width: 300, height: 100)
        }
    }
}

struct ImagePaintView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintView()
    }
}
