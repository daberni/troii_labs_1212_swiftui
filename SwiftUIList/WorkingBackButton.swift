//
//  WorkingBackButton.swift
//  SwiftUIList
//
//  Created by Bernhard Danecker on 12.12.19.
//  Copyright © 2019 Stefan Gugarel. All rights reserved.
//

import SwiftUI

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

