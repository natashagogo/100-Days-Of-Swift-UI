//
//  ContentView.swift
//  Drawing
//
//  Created by Natasha Godwin on 5/8/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    // Calculate the inset
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
    
    // Draw the shape
       func path(in rect: CGRect) -> Path {
           // Shapes start from the bottom-left corner and go around.
           // To start from the top-left corner, subtract 90 degrees from the starting and end angles
           let rotationAdjustment = Angle.degrees(90)
           let modifiedStart = startAngle - rotationAdjustment
           let modifiedEnd = endAngle - rotationAdjustment
           
           var path = Path()
           
           // !clockwise makes the arc start at the top-right
           path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
           
           return path
       }
}

struct ContentView: View {
    var body: some View {
       Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
         .strokeBorder(Color.blue, lineWidth: 10)
         .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
