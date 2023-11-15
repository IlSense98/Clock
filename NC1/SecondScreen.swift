//
//  SecondScreen.swift
//  NC1
//
//  Created by Fernando Sensenhauser on 15/11/23.
//

import SwiftUI

struct SecondScreen: View {
    var body: some View {
        DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Data e ora")
                .padding()
        })
    }
}

#Preview {
    SecondScreen()
}
