//
//  InformationCell.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct WeatherInformation: View {
    
    var weatherInformation: String = "27'C | 맑음"
    
    var weatherText1: String = "오늘같은 날은"
    var weatherText2: String = "산책이라도"
    var weatherText3: String = "하고 와볼까요?"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(weatherInformation)
                .font(.system(size: 16))
            
            VStack(alignment: .leading, spacing: 0) {
                Text(weatherText1)
                Text(weatherText2)
                Text(weatherText3)
            }
            .font(.system(size: 24, weight: .semibold))
        }
        .foregroundColor(Color(hex: "#FFFFFF"))
    }
}


#Preview {
    ZStack {
        Color.gray.opacity(0.5).ignoresSafeArea(edges: .all)
        WeatherInformation()
    }
}
