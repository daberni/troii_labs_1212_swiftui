//
//  EditTaskView.swift
//  SwiftUIList
//
//  Created by Stefan Gugarel on 12.12.19.
//  Copyright © 2019 Stefan Gugarel. All rights reserved.
//

import SwiftUI

struct WorkingEditTaskView: View {
    
    @Binding var pushed: Bool
    let task: Task

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: WorkingBackButton(label: "Back") {
            self.pushed = false
        })
    }
}

struct WorkingBackButton: View {
    let label: String
    let closure: () -> ()

    var body: some View {
        Button(action: { self.closure() }) {
            HStack {
                Image(systemName: "chevron.left")
                Text(label)
            }
        }
    }
}


struct WorkingEditTaskView_Previews: PreviewProvider {
    @State private static var pushed: Bool = false

    static var previews: some View {
        WorkingEditTaskView(pushed: $pushed, task: Task(name: "", favourite: false))
    }
}
