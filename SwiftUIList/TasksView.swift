//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Stefan Gugarel on 12.12.19.
//  Copyright © 2019 Stefan Gugarel. All rights reserved.
//

import SwiftUI

struct TasksView: View {

    let task1 = Task(name: "test", favourite: true)

    var tasks: [Task] = [Task(name: "Troii Kaffee", favourite: true),
                         Task(name: "Labs Day", favourite: false)]


    var body: some View {
        NavigationView {
            List(tasks) { task in
                TaskItemView(task: task)
            }
            .navigationBarTitle(Text("Todos").foregroundColor(Color.red))
            .navigationBarItems(trailing: NavigationLink(destination: EditTaskView(), label: {
                Text("Hinzufügen")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
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
                Image(systemName: "star").foregroundColor(Color.yellow)
            } else {
                Image(systemName: "star").foregroundColor(Color.gray)
            }
        }
    }
}