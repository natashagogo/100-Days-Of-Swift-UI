//
//  ArcView.swift
//  Drawing
//
//  Created by Natasha Godwin on 6/7/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

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

struct ArcView: View {
    var body: some View {
        HStack(spacing: 50) {
            // with .stroke - arc is drawn on the center of the path
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: false)
              .stroke(Color.blue, lineWidth: 20)
              .frame(width: 100, height: 100)
            
            // with .strokeBorder() - arc is drawn inside the path
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: false)
             .strokeBorder(Color.blue, lineWidth: 20)
             .frame(width: 100, height: 100)
        }
    }
}

struct ArcView_Previews: PreviewProvider {
    static var previews: some View {
        ArcView()
    }
}
