//
//  StopBellView.swift
//  Ae-shley
//
//  Created by Seo-Jooyoung on 8/11/24.
//

import SwiftUI

struct StopBellView: View {
    var body: some View {
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
            
            ZStack {
                Circle()
                    .frame(width: 280, height: 280)
                    .foregroundStyle(Color.red)
                Text("STOP")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
            }
            
            Spacer()
        }
        .padding(.vertical, 72)
    }
}

#Preview {
    StopBellView()
}
