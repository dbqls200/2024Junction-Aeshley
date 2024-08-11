//
//  BusNumberInputView.swift
//  Ae-shley
//
//  Created by 김유빈 on 8/11/24.
//

import SwiftUI

struct BusNumberInputView: View {
    @State var busNumber: String
    @State private var keyboardHeight: CGFloat = 0
    
    @Environment(Coordinator.self) private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 48) {
                Spacer()
                Text("Please enter\nthe bus number")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.yellow)
                    .font(.system(size: 32, weight: .black))
                
                VStack(alignment: .center) {
                    TextField(
                        "Search for destination",
                        text: $busNumber,
                        prompt: Text("")
                            .foregroundStyle(Color.textDarkYellow))
                    .padding(.horizontal, 120)
                    .foregroundStyle(Color.yellow)
                    .font(.system(size: 64, weight: .bold))
                    .keyboardType(.numberPad)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(Color.yellow)
                        .padding(.horizontal, 120)
                }
                
                
                Spacer()
                
                Button {
                    coordinator.navigate(to: .goToDestInputView(busNumber: busNumber))
                } label: {
                    ZStack {
                        if busNumber.isEmpty {
                            Rectangle()
                                .frame(height: 68)
                                .foregroundStyle(Color.textDarkYellow)
                            
                            Text("Before entering")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 20, weight: .bold))
                        } else {
                            Rectangle()
                                .frame(height: 68)
                                .foregroundStyle(Color.yellow)
                            
                            Text("Entry complete")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 20, weight: .bold))
                        }
                    }
                    .disabled(busNumber.isEmpty ? true : false)
                    
                }
            }
            .scrollDismissesKeyboard(.automatic)
            .navigationBarBackButtonHidden(true)
        }
    }
}
