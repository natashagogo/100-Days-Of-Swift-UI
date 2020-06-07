//
//  ContentView.swift
//  Drawing
//
//  Created by Natasha Godwin on 6/7/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rectangle: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rectangle.midX, y: rectangle.minY))
        path.addLine(to: CGPoint(x: rectangle.minX, y: rectangle.maxY))
         path.addLine(to: CGPoint(x: rectangle.maxX, y: rectangle.maxY))
        path.addLine(to: CGPoint(x: rectangle.midX, y: rectangle.minY))

        return path
    }
}


struct Arc: Shape, InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
    
    // This method is required by the InsettableShape protocol
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}


struct ContentView: View {
    var body: some View {
    VStack {
        HStack(spacing: 30) {
            // Basic Shape
           Rectangle()
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 100, height: 100)
   
           // Custom Shapes
           Triangle()
           .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
           .frame(width: 100, height: 100)
           
           Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: false)
           .stroke(Color.blue, lineWidth: 10)
           .frame(width: 100, height: 100)
         }
        // Insettable Shapes
        // .strokeBorder() only works with Insettable Shapes
        HStack {
            Circle()
                .strokeBorder(Color.blue, lineWidth: 80)
            Arc(startAngle: .degrees(0), endAngle: .degrees(80), clockwise: true)
              .strokeBorder(Color.purple, lineWidth: 40)
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
