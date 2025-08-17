//
//  TodayCoinCell.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct TodayCoinCell: View {
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("8월 15일 (금)")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(hex: "#DF655D"))
                Text("오늘 모은 코인")
                    .font(.system(size: 20, weight: .semibold))
            }
            
            Spacer()
            
            HStack(spacing: 4) {
                Image("Coin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text("100")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(hex: "#DF655D"))
            }
        }
        .padding(EdgeInsets(top: 32, leading: 28, bottom: 32, trailing: 28))
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(hex: "#FFFFFF"))
        )
    }
}


#Preview {
    ZStack {
        Color.gray.opacity(0.5).ignoresSafeArea(edges: .all)
        TodayCoinCell()
    }
}
