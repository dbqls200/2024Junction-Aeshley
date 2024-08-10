//
//  InfoInputView.swift
//  Ae-shley
//
//  Created by Seo-Jooyoung on 8/11/24.
//

import SwiftUI

struct InfoInputView: View {
    @StateObject private var locationManager = CoreLocationManager()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
                
            VStack(spacing: 100) {
                HStack {
                    Text("We'll help you get off the bus!")
                        .foregroundStyle(.yellow)
                        .font(.system(size: 32, weight: .bold))
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                NavigationLink {
                    BusNumberInputView(busNumber: "")
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
        }
    }
}


#Preview {
    InfoInputView()
}
