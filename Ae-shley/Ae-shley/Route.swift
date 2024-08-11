//
//  Route.swift
//  Ae-shley
//
//  Created by Seo-Jooyoung on 8/11/24.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case goToBusNumberInputView
    case goToDestInputView(busNumber: String)
    case goToBusInfoView(busNumber: String, destination: String)
    case goToStopBellView
}
