//
//  Ae_shleyApp.swift
//  Ae-shley
//
//  Created by 김유빈 on 8/10/24.
//

import SwiftUI

@main
struct Ae_shleyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                InfoInputView()
            }
            .navigationBarBackButtonHidden()
        }
    }
}
