//
//  LocationManager.swift
//  OneStep
//
//  Created by Lucid on 8/18/25.
//

import SwiftUI
import CoreLocation

@MainActor
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let mgr = CLLocationManager()
    
    @Published var coordinate: CLLocationCoordinate2D? = nil
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        super.init()
        mgr.delegate = self
        checkAuthorization()
    }
    
    // 권한 체크
    private func checkAuthorization() {
        switch mgr.authorizationStatus {
        case .notDetermined:
            mgr.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            mgr.startUpdatingLocation()
        default:
            break
        }
    }
    
    // 권한 변경 감지
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            mgr.startUpdatingLocation()
        }
    }
    
    // 위치 업데이트
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last {
            coordinate = loc.coordinate
        }
    }
}


// CLLocationCoordinate2D를 Equatable로 확정
extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
