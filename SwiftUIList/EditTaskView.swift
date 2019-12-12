//
//  EditTaskView.swift
//  SwiftUIList
//
//  Created by Bernhard Danecker on 12.12.19.
//  Copyright © 2019 Stefan Gugarel. All rights reserved.
//

import SwiftUI

struct EditTaskView: View {
     let task: Task
    
    init(task: Task = Task(name: "", favourite: false)) {
        self.task = task
    }
    
   var body: some View {
       Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
   }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView()
    }
}
