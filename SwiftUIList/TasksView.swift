//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Stefan Gugarel on 12.12.19.
//  Copyright © 2019 Stefan Gugarel. All rights reserved.
//

import SwiftUI

struct TasksView: View {
    
    @State var tasks: [Task]

    @State private var pushed: Bool = false
    
    @State var editName: String = ""
    @State var editFavourite: Bool = false

    var body: some View {
        NavigationView {
            List(tasks) { task in
                NavigationLink(destination: EditTaskView(name: self.$editName, favourite: self.$editFavourite)) {
                    TaskItemView(task: task)
                        .onAppear {
                            // self.editName = task.name
                            // self.editFavourite = task.favourite
                        }
                        .onDisappear {
                            let newTasks = self.tasks
                            if var found = newTasks.first(where: { $0.id == task.id }) {
                                found.name = self.editName
                                found.favourite = self.editFavourite
                            }

                            self.tasks = newTasks
                        }
                }
            }
            .navigationBarTitle(
                Text("Todos").foregroundColor(Color.red)
            )
            .navigationBarItems(trailing: HStack {
                Button("Gude Hinzufügen") {
                   self.pushed.toggle()
                }
                NavigationLink(destination: WorkingEditTaskView(pushed: $pushed, task: Task(name: "", favourite: false)), isActive: $pushed) { EmptyView()
                }
                NavigationLink("Schlechde Hinzufügen", destination: EditTaskView(name: $editName, favourite: $editFavourite)
                    .onAppear {
                        self.editName = ""
                        self.editFavourite = false
                    }
                    .onDisappear() {
                        self.tasks.append(Task(name: self.editName, favourite: self.editFavourite))
                    }
                )
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView(tasks: [
            Task(name: "Troii Kaffee", favourite: true),
            Task(name: "Labs Day", favourite: false)
        ])
    }
}

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var favourite: Bool
}

struct TaskItemView: View {

    let task: Task

    var body: some View {
        HStack {
            Text(task.name)
            Spacer()
            if task.favourite {
                Image(systemName: "star.fill").foregroundColor(Color.yellow)
            } else {
                Image(systemName: "star").foregroundColor(Color.gray)
            }
        }
    }
}
	
