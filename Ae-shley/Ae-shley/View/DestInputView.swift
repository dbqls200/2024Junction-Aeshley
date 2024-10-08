//
//  DestInputView.swift
//  Ae-shley
//
//  Created by Seo-Jooyoung on 8/11/24.
//

import SwiftUI

struct DestInputView: View {
    let busNumber: String
    @State var destination: String = ""
    @State private var keyboardHeight: CGFloat = 0
    
    @Environment(Coordinator.self) private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 48) {
                Spacer().frame(height: 72)
                Text("Please enter\nyour destination")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.yellow)
                    .font(.system(size: 32, weight: .black))
                
                VStack(alignment: .center) {
                    TextField(
                        "Search for destination",
                        text: $destination,
                        prompt: Text("")
                            .foregroundStyle(Color.textDarkYellow))
                    .padding(.horizontal, 16)
                    .foregroundStyle(Color.yellow)
                    .font(.system(size: 20, weight: .bold))
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(Color.yellow)
                        .padding(.horizontal, 16)
                }
                
                
                Spacer()
                
                Button {
                    coordinator.navigate(to: .goToBusInfoView(busNumber: busNumber, destination: destination))
                } label: {
                    if destination.isEmpty {
                        ZStack {
                            Rectangle()
                                .frame(height: 68)
                                .foregroundStyle(Color.textDarkYellow)
                            
                            Text("Before entering")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 20, weight: .bold))
                        }
                        
                    } else {
                        ZStack {
                            Rectangle()
                                .frame(height: 68)
                                .foregroundStyle(Color.yellow)
                            
                            Text("Entry complete")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 20, weight: .bold))
                        }
                        
                    }
                }
                .disabled(destination.isEmpty ? true : false)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
