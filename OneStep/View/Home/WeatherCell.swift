//
//  WeatherCell.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct WeatherCell: View {
    
    @StateObject private var locMgr = LocationManager()
    @StateObject private var weatherMgr = WeatherManager()
    
    var body: some View {
        ZStack(alignment: .leading) {
            if weatherMgr.description == "Clear" ||
                weatherMgr.description == "Mostly Clear" ||
                weatherMgr.description == "Partly Cloudy" {
                Image("Sunny")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } else if weatherMgr.description == "Cloudy" ||
                        weatherMgr.description == "Mostly Cloudy" ||
                        weatherMgr.description == "Fog" ||
                        weatherMgr.description == "Haze" ||
                        weatherMgr.description == "Smoke" ||
                        weatherMgr.description == "Wind" {
                Image("Cloudy")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } else if weatherMgr.description == "Rain" ||
                        weatherMgr.description == "Heavy Rain" ||
                        weatherMgr.description == "Shower" ||
                        weatherMgr.description == "Sleet" ||
                        weatherMgr.description == "Snow" ||
                        weatherMgr.description == "Heavy Snow" ||
                        weatherMgr.description == "Hail" {
                Image("Rainy")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } else if weatherMgr.description == "Thunderstorm" ||
                        weatherMgr.description == "Tornado" ||
                        weatherMgr.description == "Hurricane" {
                Image("Thunder")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } else {
                Image("Sunny")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            VStack(alignment: .leading, spacing: 84) {
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
