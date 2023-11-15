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
    var giri: [Giri] = [Giri(giro: "")]
    @State var arrayDiGiri: [Giri] = [Giri(giro: "")]
    @State var isTimerRunning = false
    @State private var startTime =  Date()
    @State private var timerString = "0.00"
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    init() {
        arrayDiGiri = [Giri(giro: "")]
        self.giri = []
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
                    var giroTest = timerString
                    var x = Giri(giro: giroTest)
                    arrayDiGiri.append(Giri(giro: giroTest))
                } label: {
                    Text("Giro")
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
                        Text("Avvia")
                    }
                    else {
                        Text("Interrompi")
                    }
                }
                .padding()
            }
            ScrollView {
                VStack {
                    ForEach (arrayDiGiri, id:\.id) { giro in
                        //ext(giro.giro)
                        //Text("ok")
                        Text(giro.giro)
                    }
                }
            }
        }
    }
}


#Preview {
    FourthScreen()
}


/*
var timerControls: some View {
    var model : TimerViewModel
    HStack {
        Button("Cancel") {
            model.state = .cancelled
        }
        .buttonStyle(.automatic)
        

        Spacer()

        switch model.state {
        case .cancelled:
            Button("Start") {
                model.state = .active
            }
            .buttonStyle(.automatic)
           
        case .paused:
            Button("Resume") {
                model.state = .resumed
            }
            .buttonStyle(.automatic)
        case .active, .resumed:
            Button("Pause") {
                model.state = .paused
            }
            .buttonStyle(.automatic)
        }
    }
    .padding(.horizontal, 32)
 }*/
