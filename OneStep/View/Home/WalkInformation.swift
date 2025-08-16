//
//  WalkInformation.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI

struct WalkInformation: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 4) {
                Image("Walk")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                Text("오늘의 걸음")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(hex: "#626262"))
            }
            
            HStack(spacing: 0) {
                Text("256")
                    .font(.system(size: 30, weight: .medium))
                    .foregroundColor(Color(hex: "#303030"))
                Text(" / 20,000")
                    .font(.system(size: 17))
                    .foregroundColor(Color(hex: "#A4A7AE"))
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(hex: "#FFFFFF").opacity(0.5))
        )
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.5).ignoresSafeArea(edges: .all)
        WalkInformation()
    }
}
