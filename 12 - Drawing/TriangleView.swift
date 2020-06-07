//
//  TriangleView.swift
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

struct TriangleView: View {
    var body: some View {
        Triangle()
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 100, height: 100)
    }
}

struct TriangleView_Previews: PreviewProvider {
    static var previews: some View {
        TriangleView()
    }
}
