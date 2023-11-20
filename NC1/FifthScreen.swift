//
//  FifthScreen.swift
//  NC1
//
//  Created by Fernando Sensenhauser on 15/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var countdownTimer: Int =  10
    @State var timerRunning: Bool = false
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack {
            Text("\(countdownTimer)")
                .padding()
                .onReceive(timer) { _ in
                    print(countdownTimer, timerRunning)
                    if (countdownTimer > 0 && timerRunning) {
                        countdownTimer -= 1
                    }
                }
                .font(.system(size: 40, weight: .bold))
            
            HStack(spacing:30) {
                
                Button(action: {
                        timerRunning = true
                }, label: {
                    Text("Start")
                })
             
                
//                Button(action: {
//                    timerRunning = true
//                },
//                       label: {
//                    Text("Start")
//                })

                Button(action: {
                    //per resettare il timer
//                    timer.upstream.connect().cancel()
                   // self.timer.upstream.connect().cancel()
                    countdownTimer = 10
                    timerRunning = false
                }, label: {
                    Text("Reset")
                })
                .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    ContentView()
}
