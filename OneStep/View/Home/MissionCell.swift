//
//  MissionCell.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI

struct MissionCell: View {
    
    let mission: MissionDataModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image(mission.missionImage)
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(mission.missionTitle)
                
                HStack(spacing: 4) {
                    Image("Coin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    Text("\(mission.missionCoin)")
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

#Preview {
    ZStack {
        Color.gray.opacity(0.5).ignoresSafeArea(.all)
        MissionCell(mission: MissionDataModel(
            missionImage: "Sunny",
            missionTitle: "하루 10분 운동하기",
            missionCoin: 100
        ))
    }
}
