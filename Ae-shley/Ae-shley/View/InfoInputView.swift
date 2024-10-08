//
//  InfoInputView.swift
//  Ae-shley
//
//  Created by Seo-Jooyoung on 8/11/24.
//

import SwiftUI

struct InfoInputView: View {
    @StateObject private var locationManager = CoreLocationManager()
    let notiManager = NotificationManager.instance
    
    @Environment(Coordinator.self) private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 100) {
                Text("We'll help you\nget off the bus!")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.yellow)
                    .font(.system(size: 32, weight: .black))
                
                Button {
                    coordinator.navigate(to: .goToBusNumberInputView)
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 280, height: 280)
                        
                        Text("Enter Moving Information")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 20, weight: .bold))
                    }
                }
                
                Text("My Location : \(locationManager.address ?? "")")
                    .foregroundStyle(.yellow)
                    .font(.system(size: 16, weight: .bold))
                    .padding(.top, 28)
                
            }
            .padding(.vertical, 70)
        }
        .onAppear {
            notiManager.requestAuthorization()
            locationManager.checkLocationAuthorization()
        }
    }
}


#Preview {
    InfoInputView()
}
