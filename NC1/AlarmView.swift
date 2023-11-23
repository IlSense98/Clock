//
//  AlarmView.swift
//  NC1
//
//  Created by Fernando Sensenhauser on 20/11/23.
//

import SwiftUI
import AVFoundation


struct AddAlarmView: View {
    @Binding var alarms: [Alarm]
    @State private var date = Date()
    @State private var label = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Select time", selection: $date, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                
                GroupBox {
                    TextField("Label", text: $label)
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                Spacer()
            }
            .padding(.top, 50)
            .preferredColorScheme(.light)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        alarms.append(Alarm(time: date, label: label, isOn: true))
                        scheduleNotification(for: Alarm(time: date, label: label, isOn: true))
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(.title3)
                            .foregroundColor(.blue)
                            .bold()
                    }
                }
            }
        }
    }
}

func scheduleNotification(for alarm: Alarm) {

    let content = UNMutableNotificationContent()
    content.title = "Alarm"
    content.body = "Time to \(alarm.label)"
    content.sound = UNNotificationSound.default
    let components = Calendar.current.dateComponents([.year, .month, .hour, .minute], from: alarm.time)
    let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

    let request = UNNotificationRequest(identifier: alarm.id.uuidString, content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request)
}

struct Alarm: Identifiable, Equatable {
    var id = UUID() // provide default value
    var time: Date
    var label = "" // provide default value
    var isOn: Bool
}



struct AddAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        let alarms = Binding.constant([Alarm]())
        AddAlarmView(alarms: alarms)
    }
}
