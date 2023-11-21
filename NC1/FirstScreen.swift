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
                Text("Local times")
            }
            AlarmView().tabItem{
                Image(systemName: "alarm")
                Text("Alarm")
            }
            FourthScreen().tabItem {
                Image(systemName: "stopwatch")
                Text("Stopwatch")
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
