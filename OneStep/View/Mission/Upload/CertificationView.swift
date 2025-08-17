//
//  CertificationView.swift
//  OneStep
//
//  Created by Lucid on 8/18/25.
//

import SwiftUI


struct CertificationView: View {
    var body: some View {
        ZStack {
            Color(hex: "#FAF9F9").ignoresSafeArea(edges: .all)
            
            VStack(spacing: 20) {
                Spacer()
                
                Text("인증완료!")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(hex: "#55D055"))
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(hex: "#EFFFF5"))
                    )
                    .padding(.bottom, 4)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray)
                        .frame(width: 320, height: 364)
                        .padding(.bottom, 12)
                    
                    Text("침구류 정리하고 사진찍기")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(hex: "#FFFFFF"))
                        .padding(EdgeInsets(top: 20, leading: 12, bottom: 20, trailing: 12))
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(hex: "#000000").opacity(0.4))
                        )
                    
                    Image("Particle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 396, height: 348)
                }
                
                VStack {
                    Text("침구류 정리하고 사진찍기")
                    Text("미션을 완료했어요!")
                }
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(hex: "#000000"))
                
                HStack(spacing: 0) {
                    Text("+")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(Color(hex: "#DF655D"))
                    
                    Image("Coin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Text("20")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(Color(hex: "#DF655D"))
                }
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(hex: "#FFFFFF"))
                )
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    HStack {
                        Spacer()
                        
                        Text("홈으로 돌아가기")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(Color(hex: "#FFFFFF"))
                        
                        Spacer()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(hex: "#DF655D"))
                            .frame(height: 68)
                    )
                })
                .padding(.horizontal, 16)
                .padding(.bottom, 45)
            }
        }
    }
}


#Preview {
    CertificationView()
}
