//
//  Coupon.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/18/25.
//

import Foundation

struct Coupon: Hashable, Codable {
    let id: Int
    let productName: String
    let brandName: String
    let productImageUrl: String
    let barcodeImageUrl: String
    let coinPrice: Int
}


let mockCoupons: [Coupon] = [
    Coupon(id: 1, productName: "1,000원 쿠폰", brandName: "GS25", productImageUrl: "coffee", barcodeImageUrl: "123456789", coinPrice: 1000),
    Coupon(id: 2, productName: "3,000원 쿠폰", brandName: "캐시딜", productImageUrl: "coupon", barcodeImageUrl: "987654321", coinPrice: 3000),
    Coupon(id: 3, productName: "1,000원 쿠폰", brandName: "GS25", productImageUrl: "coffee", barcodeImageUrl: "123456789", coinPrice: 1000),
    Coupon(id: 4, productName: "3,000원 쿠폰", brandName: "캐시딜", productImageUrl: "coupon", barcodeImageUrl: "987654321", coinPrice: 3000),
    Coupon(id: 5, productName: "1,000원 쿠폰", brandName: "GS25", productImageUrl: "coffee", barcodeImageUrl: "123456789", coinPrice: 1000),
    Coupon(id: 6, productName: "3,000원 쿠폰", brandName: "캐시딜", productImageUrl: "coupon", barcodeImageUrl: "987654321", coinPrice: 3000),
    Coupon(id: 7, productName: "1,000원 쿠폰", brandName: "GS25", productImageUrl: "coffee", barcodeImageUrl: "123456789", coinPrice: 1000),
    Coupon(id: 8, productName: "3,000원 쿠폰", brandName: "캐시딜", productImageUrl: "coupon", barcodeImageUrl: "987654321", coinPrice: 3000)
]

