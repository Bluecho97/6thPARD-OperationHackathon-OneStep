//
//  WeekMissionCell.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct WeekMissionCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("이번주의 특별 미션")
                .font(.system(size: 20, weight: .semibold))
            
            ForEach(MissionDataModel.MissionData[1]) { item in
                MissionCell(mission: item)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(hex: "#FFB1AC"), Color(hex: "#FFAFCC")]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
            )
        }
    }
}


#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea(edges: .all)
        WeekMissionCell()
    }
}
