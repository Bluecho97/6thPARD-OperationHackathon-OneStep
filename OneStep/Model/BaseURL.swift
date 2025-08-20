//
//  BaseURL.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/20/25.
//

enum BaseURL : String {
    case baseUrl = "https://pardonestep.shop"
}
 
enum ErrorType : Error {
    case invalidURL
    case invalidResponse
    case networkError
}
