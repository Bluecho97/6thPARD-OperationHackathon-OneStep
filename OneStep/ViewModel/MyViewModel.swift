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

final class MyViewModel: ObservableObject {
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
