//
//  MyViewModel.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/20/25.
//


import SwiftUI
import Foundation

struct MissionDaysResponse: Codable {
    public let userName: String
    public let missionCompletionDays: Int
}

let mockMissionDays:MissionDaysResponse = MissionDaysResponse(userName: "김경동", missionCompletionDays: 7)

final class MyViewModel: ObservableObject {
    @Published var missionDays: MissionDaysResponse? = nil
    @Published var coupons: [Coupon] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    public func fetchMissionDays(appleToken: String) async {
        isLoading = true
        defer { isLoading = false }
        do {
            let result = try await getMissionDays(appleToken: appleToken)
            DispatchQueue.main.async {
                self.missionDays = result
            }
        } catch {
            DispatchQueue.main.async {
                self.missionDays = mockMissionDays
//                self.errorMessage = "미션 데이터를 불러오지 못했습니다."
            }
        }
    }
    
    public func fetchCoupons(appleToken: String) async {
        isLoading = true
        defer { isLoading = false }
        do {
            let result = try await getCoupons(appleToken: appleToken)
            DispatchQueue.main.async {
                self.coupons = result
            }
        } catch {
            DispatchQueue.main.async {
                self.coupons = mockCoupons
//                self.errorMessage = "쿠폰 데이터를 불러오지 못했습니다."
            
            }
        }
    }
    
    
    public func getMissionDays(appleToken: String) async throws -> MissionDaysResponse {
        let urlString = BaseURL.baseUrl.rawValue
        guard let url = URL(string: "\(urlString)/api/users/mission-days") else {
            print("❌ 잘못된 URL: \(urlString)/api/users/mission-days")
            throw ErrorType.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(appleToken, forHTTPHeaderField: "Apple-Token")
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("❌ 잘못된 응답: \(response)")
                throw ErrorType.invalidResponse
            }
            
            do {
                let result = try JSONDecoder().decode(MissionDaysResponse.self, from: data)
                print("✅ 성공적으로 수신")
                return result
            } catch {
                print("❌ 디코딩 실패: \(error.localizedDescription)")
                if let responseBody = String(data: data, encoding: .utf8) {
                    print("📦 서버 응답 본문:\n\(responseBody)")
                }
                throw ErrorType.networkError
            }
        } catch {
            print("❌ 네트워크 요청 실패: \(error.localizedDescription)")
            throw ErrorType.networkError
        }
    }
    
    public func getCoupons(appleToken: String) async throws -> [Coupon] {
        let urlString = BaseURL.baseUrl.rawValue
        guard let url = URL(string: "\(urlString)/api/purchases/coupons") else {
            print("❌ 잘못된 URL: \(urlString)/api/purchases/coupons")
            throw ErrorType.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(appleToken, forHTTPHeaderField: "Apple-Token")
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("❌ 잘못된 응답: \(response)")
                throw ErrorType.invalidResponse
            }
            
            do {
                let result = try JSONDecoder().decode([Coupon].self, from: data)
                print("✅ 성공적으로 수신")
                return result
            } catch {
                print("❌ 디코딩 실패: \(error.localizedDescription)")
                if let responseBody = String(data: data, encoding: .utf8) {
                    print("📦 서버 응답 본문:\n\(responseBody)")
                }
                throw ErrorType.networkError
            }
        } catch {
            print("❌ 네트워크 요청 실패: \(error.localizedDescription)")
            throw ErrorType.networkError
        }
    }
}
