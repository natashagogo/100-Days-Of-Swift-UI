//
//  ContentView.swift
//  ToDoList
//
//  Created by Natasha Godwin on 5/26/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var list = TaskList()
    @State private var showingAddTask = false
    var body: some View {
        NavigationView {
            List {
                ForEach(list.items) { item in
                    HStack {
                        VStack(alignment: .leading){
                            Text("\(item.name)")
                                .font(.headline)
                            Text("\(item.project)")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text("\(item.priority)")
                            .font(.callout)
                            .foregroundColor(.white)
                            .frame(width: 70, height: 30)
                            .background(item.priority == "High" ? Color.red : Color.blue)
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationBarTitle("To-Do List")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    self.showingAddTask = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showingAddTask) {
            AddTask(list: self.list)
        }
    }
    func deleteTask(at locations: IndexSet) {
        list.items.remove(atOffsets: locations)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
