//
//  HomeView.swift
//  Ae-shley
//
//  Created by 김유빈 on 8/11/24.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager()
    private init() {}
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("SUCCESS")
            }
        }
    }
    
    enum TriggerType: String {
        case time = "time"
        
        var trigger: UNNotificationTrigger {
            switch self {
            case .time:
                return UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
            }
        }
    }
    
    func scheduleNotification(trigger: TriggerType) {
        let content = UNMutableNotificationContent()
        content.title = "Tab the stop button"
        content.subtitle = "One stop before your destination"
        content.sound = .default
        content.badge = 1
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger.trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}

struct LocalNotificationBootCamp: View {
    let manager = NotificationManager.instance
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Permission") {
                manager.requestAuthorization()
            }
            Button("Schedule Notification Time") {
                manager.scheduleNotification(trigger: .time)
            }
        }
    }
}

//#Preview {
//    NotificationManager()
//}
