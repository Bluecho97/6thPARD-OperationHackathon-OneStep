//
//  WeatherManager.swift
//  OneStep
//
//  Created by Lucid on 8/18/25.
//

import SwiftUI
import WeatherKit
import CoreLocation


@MainActor
class WeatherManager: ObservableObject {
    
    private let service = WeatherService.shared
    
    @Published var icon = "cloud"
    @Published var temperature = "--°C"
    @Published var description = "–"
    
    func fetchWeather(for coordinate: CLLocationCoordinate2D) async {
        do {
            let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            let weather = try await service.weather(for: location)
            
            icon = weather.currentWeather.symbolName
            let tempC = weather.currentWeather.temperature.converted(to: .celsius).value
            temperature = "\(Int(tempC))°C"
            description = weather.currentWeather.condition.description.capitalized
        } catch {
            print("Weather fetch error:", error)
        }
    }
}
