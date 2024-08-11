//
//  StopBellView.swift
//  Ae-shley
//
//  Created by Seo-Jooyoung on 8/11/24.
//

import SwiftUI

struct StopBellView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack(spacing: 100) {
                HStack {
                    Text("Please touch the \nstop botton")
                        .frame(alignment: .leading)
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.red)
                    Spacer()
                }
                .padding(.horizontal, 27)
                
                Button {
                    // 하차 벨 누르기 성공하면 햅틱으로 알림
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 280, height: 280)
                            .foregroundStyle(Color.red)
                        Text("STOP")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                }
                
                Spacer()
            }
            .padding(.vertical, 72)
        }
    }
}

#Preview {
    StopBellView()
}
