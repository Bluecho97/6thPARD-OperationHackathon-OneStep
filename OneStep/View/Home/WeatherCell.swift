//
//  WeatherCell.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct WeatherCell: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Image("Sunny")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(spacing: 84) {
                WeatherInformation()
                WalkInformation()
            }
            .padding(24)
        }
    }
}


#Preview {
    WeatherCell()
}
