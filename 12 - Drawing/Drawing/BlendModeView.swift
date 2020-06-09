//
//  BlendModeView.swift
//  Drawing
//
//  Created by Natasha Godwin on 6/8/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct BlendModeView: View {
    @State private var amount: CGFloat = 0.0
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.purple)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color.pink)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BlendModeView_Previews: PreviewProvider {
    static var previews: some View {
        BlendModeView()
    }
}
