//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 8/6/21.
//

import SwiftUI
import CoreData

/*
 Why does ForEach need an id?
 So that SwiftUI can identify each view and apply changes accordingly.

 What can you use for the id parameter in a ForEach?
 You have three options for ids:
 1. Create an object that conforms to the Identifiable protocol
 2. Use a keypath for a property that will always be unique, e.g. a book's ISBN number
 3. Use \.self

 What does the \.self keypath refer to ?
 The self keypath refers to the whole object. It's often used as an identifier in a ForEach.
 In Swift, every object is unique because Swift computes the hash value (a way of representing complex data in fixed-size values) and uses it as an identifier.

What does the Hashable protocol do?
It lets Swift generate hash values for objects, which in practice means they can be identified with \.self

What happens if you create two Core Data objects that have the exact same attributes? Can you still use \.self?
When Core Data generates a class, it as an object ID (an identifier that is unique to that object, similar to UUID). This means every object is unique, even if two Core Data objects have the same values and therefore generate the same hash value. So, yes, \.self will still work.

What do you need to make the \.self keypath work?
\.self works for anything that conforms to the Hashable protocol, which includes all of the built-in data types. When this protocol is added to an object, Swift will generate the hash value for the object and use that to uniquely identify it. This also works for Core Data’s objects because they conform to Hashable by default.

What is Codegen?

This is a property in the Inspector that controls how a Core Data class is generated. By default, its value will be Class Definition, meaning Swift will automatically generate the class. However, if you want more control over it, you can select Manual/None and create an NSManagedObject subclass.

What happens when you select Manual/None as the value for the Codegen property in the Inspector?
XCode will convert its generated code for the Core Data object into Swift files that you can see and change.

What is @NSManaged?
@NSManaged allows you to read and write property values from a dictionary that Core Data uses to store its information.

There are two things to note:
Despite its appearance, it isn't a property wrapper.
@NSManaged properties aren't actual properties. They are placeholders for values.

What happens if you remove the optionality from @NSManaged properties in an NSManagedObject subclass?

It will be possible to create an instance of the class that doesn't have any values. In other words, removing the question mark doesn't magically make those properties non-optional. They still don't need to have values.

That's because they aren't properties. They are placeholders for properties.

In short, this will create massive problems in your app down the line.

A better solution is to write computed properties that unwrap the values safely. 











 

*/

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
