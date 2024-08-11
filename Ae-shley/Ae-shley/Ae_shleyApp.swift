//
//  Ae_shleyApp.swift
//  Ae-shley
//
//  Created by 김유빈 on 8/10/24.
//

import SwiftUI

@main
struct Ae_shleyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var coordinator: Coordinator = Coordinator()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                InfoInputView()
                    .navigationDestination(for: Route.self) { route in
                        coordinator.navDestViewBuilder(route: route)
                    }
            }
            .navigationBarBackButtonHidden()
        }
        .environment(coordinator)
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            UNUserNotificationCenter.current().delegate = self
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // Foreground(앱 켜진 상태)에서도 알림 오는 설정
    func userNotificationCenter(_ center: UNUserNotificationCenter, 
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner])
    }
}
