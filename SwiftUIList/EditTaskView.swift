//
//  EditTaskView.swift
//  SwiftUIList
//
//  Created by Bernhard Danecker on 12.12.19.
//  Copyright © 2019 Stefan Gugarel. All rights reserved.
//

import SwiftUI

struct EditTaskView: View {
    
    @Binding var name: String
    @Binding var favourite: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Name:")
                Divider()
                TextField("Name", text: $name)
            }
            HStack {
                Text("Favourite:")
                Divider()
                Toggle("Favourite", isOn: $favourite)
            }
        }
    }
}

struct EditTaskView_Previews: PreviewProvider {
    @State static var name = ""
    @State static var favourite = false
    
    static var previews: some View {
        EditTaskView(name: $name, favourite: $favourite)
    }
}
