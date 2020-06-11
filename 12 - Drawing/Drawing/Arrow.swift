//
//  Arrow.swift
//  Drawing
//
//  Created by Natasha Godwin on 6/10/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ArrowHead: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        
        return path
    }
}

struct Arrow: View {
    @State private var lineWidth:
         CGFloat = 2
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
               .stroke(Color.blue, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
               .frame(height: 20)
            ArrowHead()
                .stroke(Color.blue, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
        }
        .onTapGesture {
            withAnimation {
                self.lineWidth += 1
                
                if self.lineWidth > 10 {
                    self.lineWidth = 2
                }
            }
        }
        .frame(width: 120, height: 50)
    }
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        Arrow()
    }
}
