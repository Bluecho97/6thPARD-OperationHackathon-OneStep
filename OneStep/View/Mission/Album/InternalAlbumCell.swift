//
//  InternalAlbumCell.swift
//  OneStep
//
//  Created by Lucid on 8/19/25.
//

import SwiftUI

struct InternalAlbumCell: View {
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("매일의 한걸음이 모인 곳이에요")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color(hex: "#A5A9B3"))
                    Text("오늘은 어떤 한걸음을\n내딛으셨나요?")
                        .font(.system(size: 17, weight: .semibold))
                }
                
                Spacer()
            }
            .padding(EdgeInsets(top: 20, leading: 16, bottom: 24, trailing: 0))
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(hex: "#FFFFFF"))
            )
            
            HStack {
                Spacer()
                
                Image("Album")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .offset(x: 0, y: 4)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.5).ignoresSafeArea(.all)
        InternalAlbumCell()
    }
}
