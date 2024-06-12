# 100-Days-Of-Swift-UI
 
# Introduction

<a href="https://www.hackingwithswift.com/100/swiftui/">100 Days of SwiftUI</a> is a hands-on introduction to Swift, SwiftUI, and iOS development. I picked this course, not to get a job, but to learn how to make information work for me. Going into it, I decided to ignore design and focus on data, and over time, developed a deep interest in data structures, algorithms, and geometry -- the structure, behavior, and shape of information. 

# Takeaways
This course emphasizes understanding how things work on a fundamental level and building on that knowledge incrementally over time. It involves building projects over short intervals, re-building those projects after long intervals, and building new projects based on the understanding between intervals. The free version doesn't provide solutions to project challenges or milestone projects, so there's no escaping lack of understanding. 

In the long-run, those attributes created several good habits:
 
1. Networking knowledge (taking good notes)
2. Re-reading notes before running to StackOverflow or the Hacking With Swift forum for answers (finding solutions independently)
3. Refactoring old code (reading and re-reading code)
4. Defining the technologies needed for a project and exploring their capabilities before committing to using them (approaching every project with a sense of adventure)
5. Getting the most out of existing knowledge before building on it  (not getting stuck in the Learning Zone)


# Summary 

## Swift Basics
The first 15 days of this course covered fundamental core concepts in Swift:

- Variables v. constants
- Properties v. computed properties  
- Structs v. classes 
- Conditional statements 
	- if/else
	- switch/case 
	- ternary operators 
- Data types and built-in properties and methods 
	- Basic: String, Int, Bool
	- Collections: Array, Dictionary, Set 
- Access control and static properties  
- Functions
- Closures 
- Protocols and extensions 
- Optionals


## Projects

## WeSplit (Days 16-18)
A check-sharing app that divides a bill by the number of people and shows how much everyone needs to pay, with tip. 

### Can-Dos
- Build a form
- Update UI, using an @State property wrapper
- Read and write changes to a property with two-way data binding 
- Display numbers in a TextField, using the value and format parameters
- Display a number in the user’s local currency
- Format numbers in a Text view, using either a format specifier or the format parameter.
- Track whether certain views are in focus with `@FocusState`
- Write a computed property that returns a tuple 

### Link 

## Milestone: Unit Converter (Day 19)
Built an app that converts different units of time. 

### Practiced 
- Creating forms with titles and sections
- Accepting and converting user input
- Creating segmented controls 

### Link

## Guess The Flag (Days 20-22)
Built a multiple-choice game that quizzes users on their knowledge of country flags. 

### Can-Dos
- Arrange views horizontally, vertically, and in layers 
- Create three types of gradients
- Create a card with a background color and text
- Assign a role to buttons, change their default display, and add a border or icons to them
- Display an alert

### Link 


## Views and Modifiers (Days 23-24)
Learned how SwiftUI works under the hood by exploring views and modifiers in depth. 

### Can-Dos
- Answer these questions:
    - Why does SwiftUI use structs for views?
    - What is behind the main SwiftUI view?
    - Why does modifier order matter?
    - Why does SwiftUI use `some View` for its view type?
- Use conditional and environmental modifiers
- Use Views as properties
- Create custom modifiers and containers
- Explain View composition

### Link 


## Milestone: Rock, Paper, Scissors (Day 25)
Built a more challenging version of the classic game Rock, Paper, Scissors. The app generates a random move and prompts users to respond with the winning or losing one.  

### Can-Dos 
- Create a progress bar using `GeometryReader` 

### Practiced 
- Dynamically creating buttons with `ForEach`  
- Showing the value of a variable in an alert
- Displaying different alerts according to the value of a variable 
- Styling text and UI elements

### Link 


## BetterRest (Days 26-28)
Built an app that predicts when users need to go to bed based on their estimated sleep, actual sleep, and caffeine intake. 

### Can-Dos 
- Create a DatePicker
- Create a Stepper
- Format dates
- Create a machine learning model, using tabular regression
- Explain, at a high-level, what CreateML's five machine learning algorithms do
- Explain what the CreateML app does
- Explain what targets and features are

### Link 


## WordScramble (Days 29-31)
Built a word game that presents users with a random 8-letter word and asks them to create words with it.   

### Can-dos
- Create a list
- Explain the difference between `List` and `Form`
- Explain when it's necessary to use `ForEach`
- Load a text file into an app
- Remove whitespace, new lines, and other characters from the start and end of a string
- Validate user input
    - Prevent the user from entering certain types of characters in a TextField
    - Prevent the user from entering duplicate information
    - Check whether a word is misspelled with `UITextChecker()`


## Animations (Days 32-34)
Explored how animations work in depth. 

### Can-Dos
- Create implicit animations 
- Customize animations in SwiftUI
- Animate bindings
- Create explicit animations
- Control the animation stack
- Animate gestures like drag or tap
- Show and hide views with transitions
- Build custom transitions with `ViewModifier`

### Link 


## Milestone: Multiplication Game (Days 35)
Built another multiple-choice quiz app that tests users on multiplication tables 

### Link


## iExpense (Days 36-38)
Created a multi-view app that lets users to track personal and business expenses. 

### Can-Dos
- Share data between views 
- Create a sheet 
- Delete items from a list 
- Store data with `UserDefaults` and `Codable`

### Link

## Moonshot (Days 39-42)
Built a multi-view app that displays a list of NASA missions, a detailed description of each one, and profiles of the astronauts involved. 

### Can-Dos
- Adjust the size of an image with `GeometryReader`
- Create a `ScrollView`
- Decode JSON data, using custom types, `Codable`, and `JSONDecoder`
- Write an extension on `Bundle` with generics that loads any type of data into an array of Swift objects
- Write computed properties that help dynamically load data and assets by name into a `List` view
- Write a computed property to format dates
- Write a custom initializer that pulls specific data from two separate files
- Create a custom, scrollable detail view with navigation links
- Use `.clipShape()` and `.overlay()` to change how images are displayed

## Drawing (Days 43-46)
Explored how to create paths and shapes in depth.

### Can-Dos 
- Create a custom shape
- Create complex, interactive paths, like spirographs

## Milestone: Habit Tracker (Day 47)
Built a tracking app from scratch. Users can ... 

- Add habits, with goals, to a list
- Update their progress toward their goal in a DetailView

All data is stored in UserDefaults, using Codable.


## Cupcake Corner (Day 49-52)
Built a multi-screen app for ordering cupcakes. A deep-dive into Codable. 

### Can-Dos 
- Create a class that conforms to Codable
- Load and save data from the Internet, using `URLSession` 
- Submit form data over the Internet, using URLSession, URLRequest, and Codable 
- Validate forms

## Bookworm (Day 53-56)
Built an app for tracking and rating books. A light introduction to Core Data.  

### Can-Dos 
- Explain what Core Data is and how it works
- Create a new entity in Core Data
- Use `@Environment` to create a managed object context
- Use `@FetchedRequest` to fetch entities from Core Data

## Core Data (Day 57-59)
A deep dive into how Core Data works.

### Can-Dos  
- Create an NSManagedObject subclass
- Add computed properties to that class to unwrap properties
- Explain what a hash value is, why its important, and how it makes \.self work

## Milestone: FriendFace (Day 60-61)
Built an app that downloads JSON data from the internet, converts it to Swift types, and displays it to the user as a list. Then got it to work with Core Data. 

## Instafilter (Day 62-67)
Built an app that lets users import photos from their library, then modify them using various image effects. This was an introduction to UIKit and deep-dive into Core Image. 

### Can-Dos 
- Create a custom binding
- Create an action sheet
- Explain what Core Image is
- Add filters to images, using Core Image
- Explain the difference between the four types of images in iOS development (and how they work together in SwiftUI)
- Use UIKit in a SwiftUI app
- Explain what a delegate does in UIKit
- Create a coordinator to manage a view controller
- Explain what a coordinator does in SwiftUI
- Use a UIViewController in a SwiftUI app
- Create an image filter, using Core Image
- Create a selection of Core Image filters
- Save photos to a user's library
- Ask users for permission to save photos

## Bucket List (Day 68-73)
Built a vacation planning app that lets users create a list of places they want to visit, add a description, and look up interesting places nearby. 

### Can-Dos 
- Add Comparable conformance to custom objects
- Write data to the documents directory
- Use enums to change view states
- Add MapKit to a SwiftUI app
- Add an annotation to a map
- Add a pin to a map
- Make a map pin tappable
- Make the information button inside a map pin tappable
- Add biometric authentication to an app
- Write an extension that conforms to ObservableObject
- Download data from Wikipedia
- Sort Wikipedia results

## Accessibility (Day 74-76)
Learned best practices for accessibility and made previous projects more inclusive in the process. 

### Can-Dos 
- Add labels, hints, and alternative text to views to make them more accessible
- Describe how a view works to VoiceOver
- Customize how grouped text is read by VoiceOver
- Tell the accessibility system to ignore or hide certain content

## Milestone: Photo App (Day 77-78)
Built an app for remembering people's names. Lets users import and label pictures from their photo library.
 

## Hot Prospects (Day 79-85)
Built an app for tracking professional contacts.

### Can-Dos  
- Handle errors with Result
- Disable image interpolation
- Use objectWillChange to control when change announcements get made
- Create a context menu
- Send local notifications to users
- Add a third-party library to a project
- Build a tab bar
- Share data as an environment object
- Build a list that dynamically filters content
- Generate a QR code from a string, using Core Image's QR code generator filter

## Flashzilla (Day 86-91)
Built an accessible flashcards app

### Can-Dos 
- Add gestures, using onTapGesture(), gesture(), or onLongPressGesture()
- Add haptics, using UIKit and Core Haptics
- Control user interactivity, e.g. make a view un-tappable
- Read in a user's accessibility settings
- Detect when a user has moved an app into the background or foreground
- Detect when a user has taken a screenshot
- Build an interactive stack of cards
- Quickly generate a list with SwiftUI's array initializer
- Build a countdown timer
- Pause activity in an app when the user leaves it
- Disable features and provide alternatives for users who have accessibility needs

## Layout and Geometry (Day 92-94)
Explored how layout works in depth. 

### Can-Dos 
- Align views, using different modifiers
- Explain the trade-offs involved in different alignment techniques
- Create a custom alignment guide
- Create dynamic layouts with GeometryReader

## Milestone: Dice Roll (Day 95)
Built an app that lets users roll dice and see the results. 


## SnowSeeker (Day 96-99)
Built an app to let users browse and save ski resorts for their next vacation

### Can-Dos 
- Create alerts and sheets in two ways
- Create split views
- Create dynamic layouts, using Group
- Load static example data from the bundle
- Control how NavigationView should show primary and secondary views on iPhone
- Turn a list of strings into one line, using either Array's .joined(separator:) method or Foundation's ListFormatter
- Write an extension on view that detects whether an app is running on a phone or a tablet, and if it’s a phone, show a NavigationView as a stack
- Change a view's layout in response to size classes
- Bind an alert to an optional string
- Let users mark favorites in a list  

## Final Exam (Day 100)
Done!

### Link
