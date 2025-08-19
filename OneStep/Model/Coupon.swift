//
//  Coupon.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/18/25.
//

import Foundation

//struct Coupon: Hashable, Codable{
//    let couponId: Int
//    let couponName: String
//    let couponImageName: String
//    let couponBrand: String
//    let couponBarcode: String
//    let price: Int
//}
struct Coupon: Hashable, Codable {
    let id: Int
    let brand: String
    let title: String
    let imageName: String
    let barcode: String
}

let mockCoupons: [Coupon] = [
    Coupon(id:1, brand: "GS25", title: "1,000원 쿠폰", imageName: "coffee", barcode: "123456789"),
    Coupon(id:2, brand: "캐시딜", title: "3,000원 쿠폰", imageName: "coupon", barcode: "987654321"),
    Coupon(id:3, brand: "GS25", title: "1,000원 쿠폰", imageName: "coffee", barcode: "123456789"),
    Coupon(id:4, brand: "캐시딜", title: "3,000원 쿠폰", imageName: "coupon", barcode: "987654321"),
    Coupon(id:5, brand: "GS25", title: "1,000원 쿠폰", imageName: "coffee", barcode: "123456789"),
    Coupon(id:6, brand: "캐시딜", title: "3,000원 쿠폰", imageName: "coupon", barcode: "987654321"),
    Coupon(id:7, brand: "GS25", title: "1,000원 쿠폰", imageName: "coffee", barcode: "123456789"),
    Coupon(id:8, brand: "캐시딜", title: "3,000원 쿠폰", imageName: "coupon", barcode: "987654321")
]
