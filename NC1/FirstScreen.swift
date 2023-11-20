//
//  FirstScreen.swift
//  NC1
//
//  Created by Fernando Sensenhauser on 15/11/23.
//

import SwiftUI

struct FirstScreen: View {
    var body: some View {
        
        
        TabView {
            SecondScreen().tabItem {
                Image(systemName: "globe")
                Text("Ore locali")
            }
            AlarmView().tabItem{
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
