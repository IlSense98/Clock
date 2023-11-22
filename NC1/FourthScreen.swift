//
//  FourthScreen.swift
//  NC1
//
//  Created by Fernando Sensenhauser on 15/11/23.
//

import SwiftUI
struct Giri {
    let id = UUID()
    var giro: String
    static var sampleGiro : [Giri] = [
        Giri(giro: ""),
        Giri(giro: "2"),
    ]
}

struct FourthScreen: View {
    @State var arrayDiGiri: [Giri] = [Giri(giro: "")]
    @State var isTimerRunning = false
    @State private var startTime =  Date()
    @State private var timerString = "0.00"
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    init() {
        arrayDiGiri = [Giri(giro: "")]
    }
    
    var body: some View {
        VStack {
            Text(self.timerString)
                .font(Font.system(.largeTitle, design: .monospaced))
                .onReceive(timer) { _ in
                    if self.isTimerRunning {
                        timerString = String(format: "%.2f", (Date().timeIntervalSince( self.startTime)))
                    }
                }
            
            
            HStack {
                Button {
                    let giroTest = timerString
                    arrayDiGiri.append(Giri(giro: giroTest))
                } label: {
                    Text("Lap")
                }
                .padding()
                
                Spacer()
                
                Button {
                    if !isTimerRunning {
                        timerString = "0.00"
                        startTime = Date()
                    }
                    isTimerRunning.toggle()
                } label: {
                    if isTimerRunning == false{
                        Text("Start")
                    }
                    else {
                        Text("Stop")
                    }
                }
                .padding()
            }
            ScrollView {
                VStack {
                    ForEach (arrayDiGiri, id:\.id) { giro in
                        Text(giro.giro)
                        Divider() // Add a divider between laps                    }
                    }
                }
            }
        }
    }
    
    
    #Preview {
        FourthScreen()
    }
    
}
