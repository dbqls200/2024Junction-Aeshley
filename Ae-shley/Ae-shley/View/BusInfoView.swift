//
//  BusInfoView.swift
//  Ae-shley
//
//  Created by Seo-Jooyoung on 8/11/24.
//

import SwiftUI

struct BusInfoView: View {
    @State var isOnTheBus: Bool = false
    var body: some View {
        VStack(spacing: 68) {
            if !isOnTheBus {
                Text("Waiting for\nthe bus")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 48))
            } else {
                Text("On the bus")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 48))
            }
            Spacer()
            Text("Bus No. 1000")
            Text("Get off at\nGyungju Station Bus Stop")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .font(.system(size: 20))
        .fontWeight(.bold)
        .foregroundStyle(Color.yellow)
        .padding(.vertical, 106 )
    }
}

#Preview {
    BusInfoView()
}
