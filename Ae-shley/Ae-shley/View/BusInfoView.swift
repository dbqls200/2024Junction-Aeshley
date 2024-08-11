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
    @State private var navigateToNextView = false
    
    @Environment(Coordinator.self) private var coordinator: Coordinator
    
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
                        Text("Bus No. \(busNumber)")
                            .font(.system(size: 30, weight: .bold))
                        Spacer().frame(maxHeight: 18)
                        Text("Get off at\n\(destination) Bus Stop")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20, weight: .bold))
                        
                    }
                    Spacer().frame(maxHeight: 80)
                    
                    Rectangle()
                        .frame(height: 1)
                        .padding(.horizontal, 96)
                        .foregroundStyle(Color.yellow)
                    
                    Spacer().frame(maxHeight: 80)
                    
                    Text("We’ll send you a stop button notification\none stop before your destination")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer().frame(maxHeight: 71)
                    
                    Button {
                        coordinator.goToHome()
                    } label: {
                        Text("Reset destination")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(Color.black)
                            .padding(.horizontal, 92)
                            .padding(.vertical, 20)
                            .background {
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                            }
                    }
                    
                }
                .foregroundStyle(Color.yellow)
                .padding(.vertical, 30)
            }
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
