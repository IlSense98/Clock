//
//  ThirdScreen.swift
//  NC1
//
//  Created by Fernando Sensenhauser on 15/11/23.
//

import SwiftUI
struct AlarmView: View {
    @State private var alarms: [Alarm] = []
    @State private var showAddAlarmView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(alarms) { alarm in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(alarm.time, style: .time)
                                .font(.largeTitle)
                                .foregroundColor(alarm.isOn ? .black : .gray)
                            Text(alarm.label)
                                .foregroundColor(alarm.isOn ? .black : .gray)
                        }
                        Spacer()
                        Toggle("", isOn: Binding<Bool>(
                            get: { alarm.isOn },
                            set: { newValue in
                                if let index = alarms.firstIndex(of: alarm) {
                                    alarms[index].isOn = newValue
                                }
                            }
                        ))
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            if let index = alarms.firstIndex(of: alarm) {
                                alarms.remove(at: index)
                            }
                        } label: {
                            Image(systemName: "trash")
                        }
                        .tint(.red)
                    }
                    .contextMenu {
                        Button {
                            if let index = alarms.firstIndex(of: alarm) {
                                alarms[index].isOn.toggle()
                            }
                        } label: {
                            Label(alarm.isOn ? "Turn Off" : "Turn On", systemImage: alarm.isOn ? "bell.slash.fill" : "bell.fill")
                        }
                        
                        Button {
                            if let index = alarms.firstIndex(of: alarm) {
                                alarms.remove(at: index)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .navigationTitle("Alarms")
            .preferredColorScheme(.light)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddAlarmView.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $showAddAlarmView) {
                AddAlarmView(alarms: $alarms)
            }
        }
    }
}


struct Alarm: Identifiable, Equatable {
    var id = UUID() // provide default value
    var time: Date
    var label = "" // provide default value
    var isOn: Bool
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
