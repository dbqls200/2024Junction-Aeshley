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
                        Text("Bus No. 1000")
                            .font(.system(size: 30, weight: .bold))
                        Spacer().frame(maxHeight: 18)
                        Text("Get off at\nGyungju Station Bus Stop")
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
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                isOnTheBus = true
            }
        }
    }
}

#Preview {
    BusInfoView()
}
