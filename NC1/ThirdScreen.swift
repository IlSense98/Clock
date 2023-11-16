//
//  ThirdScreen.swift
//  NC1
//
//  Created by Fernando Sensenhauser on 15/11/23.
//

import SwiftUI

struct ThirdScreen: View {
    var body: some View {
        VStack{
            HStack {
                
            
                Text("Modifica")
                    .padding()
                Spacer()
            Button {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.black)
                    
            }
            .padding()
        }
            Spacer()
           
        }
        
        
        }
        
        
    }
#Preview {
    ThirdScreen()
}
