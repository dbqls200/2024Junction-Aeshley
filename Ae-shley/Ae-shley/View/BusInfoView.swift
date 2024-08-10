//
//  BusInfoView.swift
//  Ae-shley
//
//  Created by Seo-Jooyoung on 8/11/24.
//

import SwiftUI

struct BusInfoView: View {
    let busNumber: String
    let destination: String
    
    @State var isOnTheBus: Bool = false
    
    let manager = NotificationManager.instance

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                if !isOnTheBus {
                    Text("Waiting for\nthe bus")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 48, weight: .black))
                } else {
                    Text("On the bus")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 48, weight: .black))
                }
                
                Spacer()
                
                VStack {
                    VStack {
                        Text("Bus No. \(busNumber)")
                            .font(.system(size: 30, weight: .bold))
                        Spacer().frame(maxHeight: 18)
                        Text("Get off at\n\(destination) Bus Stop")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20, weight: .bold))

                    }
                    Spacer().frame(maxHeight: 118)

                    Rectangle()
                        .frame(height: 1)
                        .padding(.horizontal, 96)
                        .foregroundStyle(Color.yellow)
                    
                    Spacer().frame(maxHeight: 118)
                    
                    Text("We’ll send you a stop button notification\none stop before your destination")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .regular))
                }
            }
            .foregroundStyle(Color.yellow)
            .padding(.vertical, 83)
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                isOnTheBus = true
            }
            manager.scheduleNotification(trigger: .time)
        }
    }
}

#Preview {
    BusInfoView(busNumber: "", destination: "")
}
