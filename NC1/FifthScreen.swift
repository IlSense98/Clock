//
//  FifthScreen.swift
//  NC1
//
//  Created by Fernando Sensenhauser on 15/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var countdownTimer = 10
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack {
            Text("\(countdownTimer)")
                .padding()
                .onReceive(timer) { _ in
                    if countdownTimer > 0 && timerRunning {
                        countdownTimer -= 1
                    } else {
                        timerRunning = false
                    }
                    
                }
                .font(.system(size: 40, weight: .bold))
            
            HStack(spacing:30) {
                Button("Start") {
                    timerRunning = true
                }
                
                Button("Reset") {
                    countdownTimer = 10
                }.foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
