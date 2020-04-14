//
//  ContentView.swift
//  Circle Pack
//
//  Created by Natasha Godwin on 4/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let value1 = 80
    let value2 = 20
    let value3 = 40
    let value4 = 70
    let maxValue = 100
    let containerWidth: CGFloat = 300
    let containerHeight: CGFloat = 300
    
    var body: some View {
        ZStack {
            Circle()
             .fill(Color.black)
             .frame(width: containerWidth, height: containerHeight)
            
            GeometryReader { geometry in
                ZStack {
                    Circle()
                      .fill(Color.white)
                      .frame(width: CGFloat(self.value1) / CGFloat(self.maxValue) * self.containerWidth, height: CGFloat(self.value1) / CGFloat(self.maxValue) * self.containerHeight)
                    
                    GeometryReader { geometry in
                        Circle()
                         .fill(Color.pink)
                            .frame(width: CGFloat(self.value2) / CGFloat(self.maxValue) * self.containerWidth, height: CGFloat(self.value2) / CGFloat(self.value1) * geometry.size.height)
                        
                        Circle()
                        .fill(Color.pink)
                            .frame(width: CGFloat(self.value3) / CGFloat(self.maxValue) * self.containerWidth, height: CGFloat(self.value3) / CGFloat(self.value1) * geometry.size.height)
                        
                        Circle()
                         .fill(Color.pink)
                            .frame(width: CGFloat(self.value4) / CGFloat(self.maxValue) * self.containerWidth, height: CGFloat(self.value4) / CGFloat(self.value1) * geometry.size.height)
                    }
                }
                
             }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
