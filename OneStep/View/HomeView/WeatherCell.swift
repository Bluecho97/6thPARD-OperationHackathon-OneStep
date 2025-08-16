//
//  WeatherCell.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct WeatherCell: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: .infinity, height: 352)
            .foregroundColor(Color.blue.opacity(0.2))
    }
}


#Preview {
    WeatherCell()
}
