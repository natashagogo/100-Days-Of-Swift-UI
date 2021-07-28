//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Natasha Godwin on 6/13/21.
//


import SwiftUI

/*

Why do Published properties have to be initialized?

Every @Published property is placed inside a struct called Published, which is written as a generic. In Swift, you can't create an instance of a generic type that doesn't have a value.

Why @Published properties don't conform to Codable

If an array, dictionary, or set contains Codable types, then the whole collection conforms to Codable. That's because Swift has rules in place to make that happen for those types. However, it doesn't provide that functionality for its Published struct.

 How to make @Published properties in a class conform to Codable

 1. Tell Swift which properties need to be loaded and saved. Create an enum that conforms to the CodingKey protocol and list the properties that should be archived and unarchived.

2. Create a custom initializer. Give the initializer a new instance of Decoder, which contains all of the app's data. Create a container whose keys match whatever cases are in the CodingKey enum. Since it's possible those keys don't exist, this should be written as a throwing call. Read values directly from the container by references cases in the enum.

3. Write a function that tells Swift how to encode the data. This is the reverse of the custom initializer: give it an Encoder instance, create a container using the CodingKeys enum for keys, then write out the values attached to each key.

What does the required keyword do?
The required means that values must be overridden with a custom implementation.
*/


struct ContentView: View {
    var body: some View {
		Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
