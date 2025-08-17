//
//  CoinCell.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct CoinCell: View {
    
    var coin: Int = 120
    
    var body: some View {
        VStack {
            HStack(spacing: 4) {
                Image("Coin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text("\(coin)")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(hex: "DF655D"))
            }
            .padding(12)
            .frame(height: 40)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(hex: "#EDEDED"))
            )
            
            Spacer()
        }
    }
}


#Preview {
    ZStack {
        Color.gray.opacity(0.5).ignoresSafeArea(edges: .all)
        CoinCell()
    }
}
