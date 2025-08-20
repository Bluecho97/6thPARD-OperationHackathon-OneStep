//
//  CouponStorageView.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/18/25.
//

import SwiftUI


struct CouponStorageView: View {
    @Binding var path: NavigationPath
    let coupons: [Coupon] = mockCoupons
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                // 상단 네비 영역
                HStack {
                    Button(action: {
                        path.removeLast()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                    .frame(width:35,height:35)
                    
                    Spacer()
                }
                .overlay(
                    Text("상품 쿠폰 저장함")
                        .font(.headline)
                        .bold(),
                    alignment: .center
                )
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // 상단 배너 카드
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("나의 한걸음으로 얻어낸 수확!")
                                    .font(.caption)
                                    .foregroundColor(.red)
                                Text("쿠폰을 사용하러\n나가보아요!")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Image("Coin")
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 1)
                        .padding(.horizontal)
                        
                        // 쿠폰 그리드
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(coupons, id:\.self) { coupon in
                                CouponCard(coupon: coupon)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
            }
            .ignoresSafeArea(edges: .bottom)
            .background(Color(.systemGroupedBackground))
        }
    }
}

struct CouponCard: View {
    let coupon: Coupon
    
    var body: some View {
        ZStack {
            VStack(spacing: 8) {
                Image(coupon.productImageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                
                VStack(spacing: 2) {
                    Text(coupon.brandName)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(coupon.productName)
                        .font(.footnote)
                        .foregroundColor(.black)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 140)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.05), radius: 1, x: 0, y: 1)
        }
    }
}
//
//#Preview {
//    CouponStorageView()
//}
