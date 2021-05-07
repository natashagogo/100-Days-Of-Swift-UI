//
//  ContentView.swift
//  SettingsApp
//
//  Created by Natasha Godwin on 5/6/21.
//

import SwiftUI

// Question
// What is a more efficient way to create each section and field within the form?

struct ContentView: View {
    @State private var name = ""
    @State private var airplaneMode = false
    @State private var wifiSelected = 0
    
    let wifiOptions = [
        "The Midnight Library",
        "Mr. Penumbra's 24-Hour Bookstore",
        "Hard-Boiled Wonderland"
    ]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.largeTitle)
                        VStack(alignment: .leading, content: {
                            TextField("Your name", text: $name)
                                .font(.title)
                            Text("Apple ID, iCloud, Media, & Purchases")
                                .font(.caption)
                        })
                    }
                }
                Section {
                    HStack {
                        Image(systemName: "airplane.circle.fill")
                            .font(.title2)
                            .foregroundColor(.orange)
                        Text("Airplane Mode")
                        Toggle("", isOn: $airplaneMode)
                    }
                    HStack {
                        Image(systemName: "wifi")
                            .font(.title2)
                            .foregroundColor(.blue)
                        Text("Wi-Fi")
                        Picker("", selection: $wifiSelected) {
                            ForEach(0..<wifiOptions.count) { option in
                                Text("\(wifiOptions[option])")
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "bolt.horizontal.circle.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                        Text("Bluetooth")
                        Spacer()
                        Text("On")
                    }
                    HStack {
                        Image(systemName: "antenna.radiowaves.left.and.right")
                            .font(.title2)
                            .foregroundColor(.green)
                        Text("Cellular")
                    }
                    HStack {
                        Image(systemName: "personalhotspot")
                            .font(.title2)
                            .foregroundColor(.green)
                        Text("Personal Hotspot")
                    }
                }
                Section {
                    HStack {
                        Image(systemName: "app.badge.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                        Text("Notifications")
                    }
                    HStack {
                        Image(systemName: "speaker.wave.2.circle.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                        Text("Sounds & Haptics")
                    }
                    HStack {
                        Image(systemName: "moon.circle.fill")
                            .font(.title2)
                            .foregroundColor(.purple)
                        Text("Do Not Disturb")
                    }
                    HStack {
                        Image(systemName: "hourglass.tophalf.fill")
                            .font(.title2)
                            .foregroundColor(.purple)
                        Text("Screen Time")
                    }
                    
                    
                }
                
            }
            .navigationBarTitle("Settings")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
