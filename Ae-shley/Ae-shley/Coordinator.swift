//
//  Coordinator.swift
//  Ae-shley
//
//  Created by Seo-Jooyoung on 8/11/24.
//

import Foundation
import SwiftUI

@Observable
final class Coordinator {
    var path: [Route] = .init()
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func goToBack() {
        path.removeLast()
    }
    
    func goToHome() {
        path.removeAll()
    }
    
    func deepLink(routes: [Route]) {
        for route in routes {
            path.append(route)
        }
    }
    
    @ViewBuilder
    func navDestViewBuilder(route: Route) -> some View {
        switch route {
        case .goToBusInfoView(let busNumber, let destination):
            BusInfoView(busNumber: busNumber, destination: destination)
        case .goToBusNumberInputView:
            BusNumberInputView(busNumber: "")
        case .goToDestInputView(let busNumber):
            DestInputView(busNumber: busNumber)
        case .goToStopBellView:
            StopBellView()
        }
    }
}
