//
//  FlowerView.swift
//  Drawing
//
//  Created by Natasha Godwin on 6/7/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct Flower: Shape {
    // How far away each petal is from the center
    var petalOffset: Double = -20
    
    // The width of each petal
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        // Contains all of the petals
        var path = Path()
        
        // Rotation in CGAffineTransform is measured in radians, with 1 radian = 3.141 or 180 degrees. 360 degrees is 3.141 (pi) * 2
        // This counts from 0 to 360 degrees, moving up an 8th each time.
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            // Rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // Move the petal to be at the center of the view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // Create a path for this petal using our properties, plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
            
            // Apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            // Add it to our main path
            path.addPath(rotatedPetal)
        }
        
        // Send the main path back
        return path
    }
    
}


struct FlowerView: View {
   @State private var petalOffset = -20.0
   @State private var petalWidth = 80.00
   
   var body: some View {
   VStack {
       Flower(petalOffset: petalOffset, petalWidth: petalWidth)
           .fill(Color.pink, style: FillStyle(eoFill: true, antialiased: false))
       
       Text("Offset")
       Slider(value: $petalOffset, in: -40...80)
           .padding([.horizontal, .bottom])
       
       Text("Width")
       Slider(value: $petalWidth, in: 0...100)
           .padding(.horizontal)
     }
  }
}

struct FlowerView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerView()
    }
}
