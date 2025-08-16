//
//  TodayOneStepCell.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct TodayOneStepCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("오늘의 한걸음")
                .font(.system(size: 20, weight: .semibold))
                
                HStack(spacing: 12) {
                    Image("Bed")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("침구류 정리하고 사진찍기")
                        
                        HStack(spacing: 4) {
                            Image("Coin")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                            
                            Text("100")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(hex: "DF655D"))
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("인증하기")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color(hex: "#DF655D"))
                            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(hex: "#FFF2EF"))
                            )
                    })
                }
                .padding(EdgeInsets(top: 30, leading: 16, bottom: 30, trailing: 16))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(hex: "#FFFFFF"))
                )
            
            HStack(spacing: 12) {
                Image("Bed")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("침구류 정리하고 사진찍기")
                    
                    HStack(spacing: 4) {
                        Image("Coin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        
                        Text("100")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color(hex: "DF655D"))
                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("인증하기")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(hex: "#DF655D"))
                        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(hex: "#FFF2EF"))
                        )
                })
            }
            .padding(EdgeInsets(top: 30, leading: 16, bottom: 30, trailing: 16))
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(hex: "#FFFFFF"))
            )
        }
    }
}


#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea(edges: .all)
        TodayOneStepCell()
    }
}
