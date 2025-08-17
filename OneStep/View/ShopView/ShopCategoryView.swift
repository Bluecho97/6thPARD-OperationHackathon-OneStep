//
//  ShopCategoryView.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/17/25.
//

import SwiftUI

struct ShopCategoryView: View {
    let myCoin:Int = 22000
    let productList: [Product] = mockProducts
    var categoryName: String = "영화"
    
    var sorting: [Int:String] = [1:"최신 등록순", 2:"많은 코인순", 3:"적은 코인순"]
    @State private var isExpanded = false
    @State var sortingKey: Int = 1
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // 리스트
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(productList, id: \.self) { product in
                        ProductItem(product: product)
                    }
                }
            }
            .padding(.top, 113)
            
            VStack(alignment:.leading, spacing:0){
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image("Coin")
                            .foregroundColor(.orange)
                        Text("\(myCoin)")
                            .foregroundColor(.orange)
                            .bold()
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(SwiftUI.Color(UIColor.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: SwiftUI.Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                }
                .overlay(
                    Text("\(categoryName) 쿠폰")
                        .font(.headline)
                        .bold(),
                    alignment: .center
                )
                
                
                // 정렬 버튼
                HStack {
                    //                Menu {
                    //                    ForEach(sorting.keys.sorted(), id: \.self) { key in
                    //                        Button(sorting[key]!){
                    //                            sortingKey = key
                    //                        }
                    //                    }
                    //                } label: {
                    //                    HStack {
                    //                        Text(sorting[sortingKey]!)
                    //                            .font(.subheadline)
                    //                        Image(systemName: "chevron.down")
                    //                            .font(.caption)
                    //                    }
                    //                }
                    //                Spacer()
                    //            }
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }) {
                        HStack {
                            Text(sorting[sortingKey]!)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.down")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(SwiftUI.Color.white)
                        .cornerRadius(20)
                        .shadow(color: SwiftUI.Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                    }
                    Spacer()
                }
                .padding(.top,13)
                .padding(.bottom,15)
                
            }
        }
        .padding(.horizontal,20)
    }
}

#Preview {
    ShopCategoryView()
}
