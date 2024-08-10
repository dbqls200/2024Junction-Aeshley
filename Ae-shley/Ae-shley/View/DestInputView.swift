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
                
                VStack {
                    TextField(
                        "Search for destination",
                        text: $dest,
                        prompt: Text("Search for destination")
                            .foregroundStyle(Color.textDarkYellow)
                            .font(.system(size: 20)))
                    .padding(.horizontal, 22)
                    .foregroundStyle(Color.yellow)
                    .font(.system(size: 20, weight: .bold))
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(Color.yellow)
                        .padding(.horizontal, 19)
                }
                
                VStack {
                    Spacer()
                    
                    Button(action: {
                        // 버튼 클릭 시 동작
                        print("Button tapped!")
                    }) {
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
            }
        }
    }
}

#Preview {
    DestInputView(dest: "")
}
