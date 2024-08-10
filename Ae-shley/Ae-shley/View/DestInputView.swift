//
//  DestInputView.swift
//  Ae-shley
//
//  Created by Seo-Jooyoung on 8/11/24.
//

import SwiftUI

struct DestInputView: View {
    @State var dest: String
    @State private var keyboardHeight: CGFloat = 0

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
                        text: $dest,
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
                
                NavigationLink {
                    BusInfoView()
                } label: {
                    if dest.isEmpty {
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
                .disabled(dest.isEmpty ? true : false)
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DestInputView(dest: "")
}
