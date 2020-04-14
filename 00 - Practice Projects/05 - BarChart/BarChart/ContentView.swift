//
//  ContentView.swift
//  BarChart
//
//  Created by Natasha Godwin on 4/12/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct Bar: View {
    var value: Int
    var maxValue: Int
    var width: CGFloat
    var valueName: String
    var barColor: Color
    
    var body: some View {
        VStack {
            Text("\(value)")
            ZStack(alignment: .bottom) {
                Capsule()
                    .fill(Color.gray)
                    .opacity(0.1)
                    .frame(width: width, height: 400)
                
                Capsule()
                    .fill(barColor)
                    .frame(width: width, height: CGFloat(value) / CGFloat(maxValue) * 400)
                    .animation(.easeOut(duration: 0.5))
            }
            Text("\(valueName)")
        }
    }
}

struct BarGraph: View {
    var data: [Int]
    var maxValueInData: Int
    var spacing: CGFloat
    var barColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Bar(value: self.data[0], maxValue: self.maxValueInData, width: (CGFloat(geometry.size.width) - 8 * self.spacing) / CGFloat(self.data.count), valueName: "Value 1", barColor: self.barColor)
                
                Bar(value: self.data[1], maxValue: self.maxValueInData, width: (CGFloat(geometry.size.width) - 8 * self.spacing) / CGFloat(self.data.count), valueName: "Value 2", barColor: self.barColor)
                
                Bar(value: self.data[2], maxValue: self.maxValueInData, width: (CGFloat(geometry.size.width) - 8 * self.spacing) / CGFloat(self.data.count), valueName: "Value 3", barColor: self.barColor)
                
                Bar(value: self.data[3], maxValue: self.maxValueInData, width: (CGFloat(geometry.size.width) - 8 * self.spacing) / CGFloat(self.data.count), valueName: "Value 4", barColor: self.barColor)
                
                Bar(value: self.data[4], maxValue: self.maxValueInData, width: (CGFloat(geometry.size.width) - 8 * self.spacing) / CGFloat(self.data.count), valueName: "Value 5", barColor: self.barColor)
            }
            
        }.frame(height: 500)
    }
}

struct ContentView: View {
    private var data: [String: [Int]] = [
        "Day": [3, 1, 2, 4, 3],
        "Week": [28, 25, 30, 29, 23],
        "Month": [31, 26, 32, 34, 8]
    ]
    
    private var dataCategoryColor: [String: Color] = [
        "Day": Color.blue,
        "Week": Color.orange,
        "Month": Color.red
    ]
    
    @State private var dataSelected: String = "Week"
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Text("Let's Graph!")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Picker("Choose Time Period", selection: $dataSelected) {
                    Text("Day").tag("Day")
                    Text("Week").tag("Week")
                    Text("Month").tag("Month")
                }
                .pickerStyle(SegmentedPickerStyle())
                .labelsHidden()
                .padding()
                
                BarGraph(data: data[dataSelected]!, maxValueInData: data[dataSelected]!.max()!, spacing: 24, barColor: dataCategoryColor[dataSelected]!)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
