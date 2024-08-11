//
//  StopBellView.swift
//  Ae-shley
//
//  Created by Seo-Jooyoung on 8/11/24.
//

import SwiftUI

struct StopBellView: View {
    let hapticManager = HapticManager.instance
    @State private var clickCount = 0  // 클릭 횟수를 추적하는 변수
    @State private var lastClickTime: Date? = nil
    
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
                    let now = Date()
                    if let lastTime = lastClickTime {
                        if now.timeIntervalSince(lastTime) < 1 {  // 0.5초 이내에 두 번 클릭한 경우
                            clickCount += 1
                        } else {
                            clickCount = 1  // 시간이 지나면 다시 1로 초기화
                        }
                    } else {
                        clickCount = 1
                    }
                    
                    lastClickTime = now  // 마지막 클릭 시간 업데이트
                    
                    if clickCount == 2 {
                        hapticManager.notification(type: .success)
                        hapticManager.impact(style: .heavy)
                        clickCount = 0  // 클릭 횟수 초기화
                    }
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
