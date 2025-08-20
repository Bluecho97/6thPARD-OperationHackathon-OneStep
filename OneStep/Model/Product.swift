//
//  ProductModel.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/16/25.
//

import Foundation

struct Product: Hashable, Codable{
    let id: Int
    let productName: String
    let brandName: String
    let productImageUrl: String
    let coinPrice: Int
    let categoryName: String
}

let mockProducts: [Product] = [
    // 식사
    Product(id: 1, productName: "치즈버거 세트", brandName: "맥도날드", productImageUrl: "coffee", coinPrice: 6500, categoryName: "식사"),
    Product(id: 2, productName: "불고기 피자", brandName: "도미노피자", productImageUrl: "latte", coinPrice: 18900, categoryName: "식사"),
    
    // 영화
    Product(id: 3, productName: "영화 관람권", brandName: "CGV", productImageUrl: "latte", coinPrice: 12000, categoryName: "영화"),
    Product(id: 4, productName: "팝콘 & 콜라 세트", brandName: "메가박스", productImageUrl: "coffee", coinPrice: 8000, categoryName: "영화"),
    
    // 생필품
    Product(id: 5, productName: "휴지 30롤", brandName: "크리넥스", productImageUrl: "coupon", coinPrice: 13900, categoryName: "생필품"),
    Product(id: 6, productName: "세탁세제", brandName: "아우라", productImageUrl: "coffee", coinPrice: 9900, categoryName: "생필품"),
    
    // 과자
    Product(id: 7, productName: "포카칩 오리지널", brandName: "오리온", productImageUrl: "coffee", coinPrice: 1500, categoryName: "과자"),
    Product(id: 8, productName: "빼빼로", brandName: "롯데제과", productImageUrl: "latte", coinPrice: 1200, categoryName: "과자"),
    
    // 카페
    Product(id: 9, productName: "아이스 아메리카노", brandName: "스타벅스", productImageUrl: "coffee", coinPrice: 4500, categoryName: "카페"),
    Product(id: 10, productName: "카페라떼", brandName: "투썸플레이스", productImageUrl: "latte", coinPrice: 4800, categoryName: "카페"),
    
    // 화장품
    Product(id: 11, productName: "에뛰드 10000원 권", brandName: "맥", productImageUrl: "coupon", coinPrice: 10000, categoryName: "화장품"),
    Product(id: 12, productName: "쿠션 파운데이션", brandName: "헤라", productImageUrl: "latte", coinPrice: 42000, categoryName: "화장품")
]

