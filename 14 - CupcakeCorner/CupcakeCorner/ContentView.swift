//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 6/13/21.
//

/*
 
 Making @Published Properties Conform to Codable
 
  @Published properties don't work with Codable.
  
  Here's why:
  - Under the hood, property wrappers are types. They add additional functionality to the properties placed inside them.
  - In the case of @Published, the type is a struct called Published.
  - The entire type is generic, which means that you can't create an instance of it directly. Instead, you have to create instances of publishable objects that contain values, e.g. Published<String> or Published<Int>
  - If an array, dictionary, or set contains Codable types, then SwiftUI will treat the entire collection as a Codable type, too.
  - However, this functionality - "if the object is Codable, the entire struct is Codable" - doesn't exist in the Published struct.
  
 This means you have to make the type conform yourself, telling which properties should be loaded and saved.
 
 How to make @Published properties conform to Codable
 
1. Create an enum that conforms to the CodingKey protocol by listing all of the properties that need to be archived and unarchived
 
 enum CodingKeys: CodingKey {
     case propertyName
 }
 
2. Create a custom initializer that will be accept a container and use it to read values of properties.
 
 required init(from decoder: Decoder) throws {
     let container = try decoder.container(keyedBy: CodingKeys.self)
     name = try container.decode(Type.self, forKey: .propertyName)
 }
 
 3. Write a function that will archive objects.
 
 func encode(to encoder: Encoder) throws {
     var container = encoder.container(keyedBy: CodingKeys.self)
     try container.encode(propertyName, forKey: .propertyName)
 }
 
 Advantages of Codable
 Unlike UserDefaults ...
 - you don't need strings
 - it automatically checks if the types are correct
 
 Sending and Receiving Codable data with URLSession
 
 I didn't understand this section at all.
 
 How to write a method to load data from the internet
 1. Create the URL that needs to be read.
 2. Wrap it in a URLRequest to indicate how the URL should be accessed
 3. Create and start a networking task from the URL request.
 4. Update the UI
 
 
 Disabling Forms
 
 You can use the .disabled() modifier to prevent users from submitting a form, unless certain conditions are met.
 
 
 */

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cupcake", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Extra Frosting")
                        }
                        Toggle(isOn: $order.addSprinkles) {
                            Text("Sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                }
            }.navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
