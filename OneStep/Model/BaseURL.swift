//
//  BaseUrl.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/19/25.
//
import Foundation

enum BaseURL : String {
    case baseUrl = "https://pardonestep.shop"
}

enum ErrorType : Error {
    case invalidURL
    case invalidResponse
    case networkError
}
