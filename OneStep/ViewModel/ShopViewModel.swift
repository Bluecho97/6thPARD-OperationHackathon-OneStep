//
//  ShopViewModel.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/19/25.
//

import SwiftUI
import Foundation


struct UserCoinInfo: Codable {
    let haveCoin: Int
    let coinsNeededForNextProduct: Int
} //coin Model

struct PurchaseResponse: Codable {
    let success: Bool
    let barcodeImageUrl: String
    let remainingCoins: Int
}

class PurchaseManager: ObservableObject {
    @Published var isShowingPurchase = false
    @Published var product: Product? = nil
}


final class ShopViewModel: ObservableObject {
    public var sortingAPI: [Int:String] = [1:"popular", 2:"price-high", 3:"price-low"]
    
    public func getUserCoinInfo(appleToken: String) async throws -> UserCoinInfo {
        let urlString = BaseURL.baseUrl.rawValue
        guard let url = URL(string: "\(urlString)/api/users/coin") else {
            print("❌ 잘못된 URL: \(urlString)/api/users/coin")
            throw ErrorType.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(appleToken, forHTTPHeaderField: "Apple-Token")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("❌ 잘못된 응답: \(response)")
                throw ErrorType.invalidResponse
            }
            
            do {
                let userCoinInfo = try JSONDecoder().decode(UserCoinInfo.self, from: data)
                print("✅ 성공적으로 수신: \(userCoinInfo)")
                return userCoinInfo
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
    
    
    public func getAffordableProducts(appleToken: String) async throws -> [Product] {
        let urlString = BaseURL.baseUrl.rawValue
        guard let url = URL(string: "\(urlString)/api/products/affordable") else {
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
                let result = try JSONDecoder().decode([Product].self, from: data)
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
    
    public func getCategoriesProducts(appleToken: String, categoryId: Int, sortingId:Int) async throws -> [Product] {
        let urlString = BaseURL.baseUrl.rawValue
        guard let url = URL(string: "\(urlString)/api/products/categories/\(categoryId)/\(sortingAPI[sortingId]!)") else {
            print("❌ 잘못된 URL: \(urlString)/api/products/categories/\(categoryId)/\(sortingAPI[sortingId]!)")
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
                let result = try JSONDecoder().decode([Product].self, from: data)
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
    
    
    
    public func purchaseProduct(appleToken: String, productId: Int) async throws -> PurchaseResponse {
        let urlString = BaseURL.baseUrl.rawValue
        guard let url = URL(string: "\(urlString)/api/purchases/products/\(productId)") else {
            print("❌ 잘못된 URL: \(urlString)/api/purchases/products/\(productId)")
            throw ErrorType.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(appleToken, forHTTPHeaderField: "Apple-Token")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("❌ 잘못된 응답: \(response)")
                throw ErrorType.invalidResponse
            }
            
            do {
                let result = try JSONDecoder().decode(PurchaseResponse.self, from: data)
                print("✅ 구매 성공: \(result)")
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
