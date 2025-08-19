//
//  InformationCell.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct WeatherInformation: View {
    
    @StateObject private var locMgr = LocationManager()
    @StateObject private var weatherMgr = WeatherManager()
    
    let sunny = ["Clear", "Mostly Clear", "Partly Cloudy"]
    let cloudy = ["Cloudy", "Mostly Cloudy", "Fog", "Haze", "Smoke", "Wind"]
    let rainy = ["Rain", "Heavy Rain", "Shower", "Sleet", "Snow", "Heavy Snow", "Hail"]
    let thunder = ["Thunderstorm", "Tornado", "Hurricane"]
    
    var korWeatherDescription: String {
        if sunny.contains(weatherMgr.description) {
            return "맑음"
        } else if cloudy.contains(weatherMgr.description) {
            return "흐림"
        } else if rainy.contains(weatherMgr.description) {
            return "비"
        } else if thunder.contains(weatherMgr.description) {
            return "천둥"
        } else {
            return "알 수 없음"
        }
    }

    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let coordinate = locMgr.coordinate {
                Text("\(weatherMgr.temperature) | \(korWeatherDescription)")
                    .font(.system(size: 16))
            } else {
                Text("위치 정보를 가져오는 중...")
                    .font(.system(size: 16))
            }
            
            VStack(alignment: .leading, spacing: 0) {
                if sunny.contains(weatherMgr.description) {
                    Text("오늘같은 날은")
                    Text("산책이라도")
                    Text("하고 와볼까요?")
                } else if cloudy.contains(weatherMgr.description) {
                    Text("날씨는 흐려도,")
                    Text("짧은 외출로")
                    Text("기분전환 어때요?")
                } else if rainy.contains(weatherMgr.description) {
                    Text("우산을 챙겨서")
                    Text("가까운 실내로")
                    Text("나가볼까요?")
                } else if thunder.contains(weatherMgr.description) {
                    Text("안전히 집에서")
                    Text("즐길 수 있는")
                    Text("미션을 해볼까요?")
                } else {
                    Text("날씨 데이터에")
                    Text("이상이 있습니다.")
                }
            }
            .font(.system(size: 24, weight: .semibold))
        }
        .foregroundColor(Color(hex: "#FFFFFF"))
        .onAppear {
            if let coordinate = locMgr.coordinate {
                Task { await weatherMgr.fetchWeather(for: coordinate) }
            }
        }
        .onChange(of: locMgr.coordinate) { newCoordinate in
            // 옵셔널 체크
            guard let coordinate = newCoordinate else { return }
            Task { await weatherMgr.fetchWeather(for: coordinate) }
        }
    }
}


#Preview {
    ZStack {
        Color.gray.opacity(0.5).ignoresSafeArea(edges: .all)
        WeatherInformation()
    }
}
