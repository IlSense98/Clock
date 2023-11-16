//
//  FirstScreen.swift
//  NC1
//
//  Created by Fernando Sensenhauser on 15/11/23.
//

import SwiftUI

struct FirstScreen: View {
    var body: some View {
        
        
        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
            
        }
        
        TabView {
            SecondScreen().tabItem {
                Image(systemName: "globe")
                Text("Ore locali")
            }
            ThirdScreen().tabItem{
                Image(systemName: "alarm")
                Text("Sveglia")
            }
            FourthScreen().tabItem {
                Image(systemName: "stopwatch")
                Text("Cronometro")
            }
           ContentView().tabItem{
                Image(systemName: "timer")
                Text("Timer")
            }
        }
    }
}

#Preview {
    FirstScreen()
}
