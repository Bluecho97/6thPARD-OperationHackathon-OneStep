//
//  ProductModel.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/16/25.
//

import Foundation

struct Product: Hashable, Codable{
    let productId: Int
    let productName: String
    let productImageName: String
    let productBrand: String
    let productCategory: String
    let price: Int
}

let mockProducts: [Product] = [
    // 식사
    Product(productId: 1, productName: "치즈버거 세트", productImageName: "burger_set", productBrand: "맥도날드", productCategory: "식사", price: 6500),
    Product(productId: 2, productName: "불고기 피자", productImageName: "pizza_bulgogi", productBrand: "도미노피자", productCategory: "식사", price: 18900),
    
    // 영화
    Product(productId: 3, productName: "영화 관람권", productImageName: "movie_ticket", productBrand: "CGV", productCategory: "영화", price: 12000),
    Product(productId: 4, productName: "팝콘 & 콜라 세트", productImageName: "popcorn_cola", productBrand: "메가박스", productCategory: "영화", price: 8000),
    
    // 생필품
    Product(productId: 5, productName: "휴지 30롤", productImageName: "toilet_paper", productBrand: "크리넥스", productCategory: "생필품", price: 13900),
    Product(productId: 6, productName: "세탁세제", productImageName: "detergent", productBrand: "아우라", productCategory: "생필품", price: 9900),
    
    // 과자
    Product(productId: 7, productName: "포카칩 오리지널", productImageName: "pocachip", productBrand: "오리온", productCategory: "과자", price: 1500),
    Product(productId: 8, productName: "빼빼로", productImageName: "pepero", productBrand: "롯데제과", productCategory: "과자", price: 1200),
    
    // 카페
    Product(productId: 9, productName: "아이스 아메리카노", productImageName: "coffee", productBrand: "스타벅스", productCategory: "카페", price: 4500),
    Product(productId: 10, productName: "카페라떼", productImageName: "latte", productBrand: "투썸플레이스", productCategory: "카페", price: 4800),
    
    // 화장품
    Product(productId: 11, productName: "에뛰드 10000원 권", productImageName: "coupon", productBrand: "맥", productCategory: "화장품", price: 10000),
    Product(productId: 12, productName: "쿠션 파운데이션", productImageName: "cushion_foundation", productBrand: "헤라", productCategory: "화장품", price: 42000)
]
