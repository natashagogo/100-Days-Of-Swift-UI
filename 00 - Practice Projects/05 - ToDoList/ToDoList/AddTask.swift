//
//  AddTask.swift
//  ToDoList
//
//  Created by Natasha Godwin on 5/31/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct AddTask: View {
    @State private var name = ""
    @State private var project = ""
    @State private var priority = "Low"
    @State private var showingError = false
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    
    static let priorities = [
        "Low",
        "High"
    ]
    
    @ObservedObject var list: TaskList
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Project", text: $project)
                Picker("Priority", selection: $priority) {
                    ForEach(Self.priorities, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            .navigationBarTitle("New Task")
            .navigationBarItems(
                leading: Button("Cancel") {
                  self.presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                self.addTask()
                self.presentationMode.wrappedValue.dismiss()
            })
        }.alert(isPresented: $showingError) {
            Alert(title: Text("Oops!"), message: Text("Please give the task a name."), dismissButton: .default(Text(
            "OK")))
        }
    }
    
    func addTask() {
        let task = Task(name: name, project: project, priority: priority)
       
        if task.name != "" && task.project != ""  {
          list.items.append(task)
        } else {
            taskError(title: "Oops!", message: "You forgot to type in the task.")
        }
        
    }
    
    func taskError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask(list: TaskList())
    }
}
