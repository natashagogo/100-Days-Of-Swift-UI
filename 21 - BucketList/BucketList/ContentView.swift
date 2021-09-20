//
//  ContentView.swift
//  BucketList
//
//  Created by Natasha Godwin on 9/20/21.
//

import SwiftUI

/*
Why shouldn't you add a closure to sorted() for custom types?
1. It's a good idea to keep model data separate from the view. There shouldn't be any data manipulation or logic inside your SwiftUI views. That way, if you make changes to your logic, your UI will automatically update to reflect the change.
2. If you want to add multiple sorts, e.g. one for each attribute, your code will get messy quickly

What does the Comparable protocol do?
This protocol allows you to make comparisons, so objects can be sorted. When you use Comparable, you can use sorted() without any parameters.

What do you need to make a type conform to Comparable?
To get a custom type to conform to Comparable:
1. Add the Comparable conformance to the object definition.
2. Add a method called < that takes two objects and returns true if the first should be sorted before the second.

What is operator overloading?
It's when you add extra functionality to a built-in operator like < or >.
You'll use operator overloading when implementing Comparable conformance for custom types.
 
Storing large amounts of data

iOS makes it easy to read and write data from device storage.
- All apps get a directory for storing files. These files are automatically synchronized with iCloud backups, meaning if the user gets a new device, their data can be restored.
- All apps are sandboxed, which means they run in their own container with a hard-to-guess directory name.

To find this directory, you'll need Apple's API for finding an app's documents directory.

What happens to the documents directory when the user deletes the app from their phone?
It gets deleted.


What is FileManager?
A class that finds the document directory for the current user.

What do you need to write data to an app's directory?
The write(to:) method, which has three parameters:
1. A URL to write to
	This can be created by combining the directory URL with a filename
2. Whether to make the write atomic, i.e. write changes all at once.
	Almost always, this is set to true. Atomic writing causes the system to write the full file to a temporary filename, until changes have been made. When it's done, it renames this temporary filename to the target filename. The advantage is that you don't lose data.
3. What character encoding to use.
	Swift's native encoding is UTF-8, so you should use this

*/

struct ContentView: View {
    var body: some View {
		WritingData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
