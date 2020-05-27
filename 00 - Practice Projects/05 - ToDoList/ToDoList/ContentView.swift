//
//  ContentView.swift
//  ToDoList
//
//  Created by Natasha Godwin on 5/26/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var newTask: String = ""
    @State private var tasks = UserDefaults.standard.stringArray(forKey: "Tasks") ?? [String]()
    var body: some View {
        NavigationView {
            VStack {
                TextField("Add To-Do Item", text: $newTask)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .padding()
                Button("Add") {
                    self.addTask(task: self.newTask)
                    UserDefaults.standard.set(self.tasks, forKey: "Tasks")
                }
                List {
                    ForEach(0..<tasks.count, id: \.self) {
                        Text("\(self.tasks[$0])")
                    }
                    .onDelete(perform: removeTask)
                }
                
            }
            .navigationBarTitle("To-Do List")
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func addTask(task: String) {
        tasks.append(task)
        newTask = ""
    }
    
    func removeTask(at locations: IndexSet) {
        tasks.remove(atOffsets: locations)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
