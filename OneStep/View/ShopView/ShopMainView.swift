//
//  ShopMainView.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/16/25.
//

import SwiftUI

struct ShopMainView: View {
    var myCoin: Int = 2200
    let Categorys: [String: String] = ["식사":"Meal", "영화":"Film", "생필품":"Live", "과자":"Snack", "카페":"Cafe", "화장품":"Beauty"]
    let productList: [Product] = mockProducts
    
    var body: some View {
        ScrollView {
            VStack(spacing:0) {
                HStack(alignment:.bottom) {
                  VStack(alignment: .leading, spacing: 5) {
                        Text("한걸음으로 이만큼이나 모았어요!")
                            .font(.subheadline)
                            .font(.system(size:14))
                            .foregroundColor(SwiftUI.Color.red)
                            .padding(0)
                        Text("나의 코인")
                            .font(.headline)
                            .font(.system(size:20))
                            .foregroundColor(SwiftUI.Color.black)
                            .padding(.top,3)
                    }
                    Spacer()
                    HStack(spacing: 5) {
                        Image("Coin")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(SwiftUI.Color.yellow)
                        Text("2200")
                            .font(.title2)
                            .font(.system(size:23))
                            .fontWeight(.bold)
                            .foregroundColor(SwiftUI.Color.red)
                    }
                }
                .padding(.horizontal,26)
                .padding(.vertical,28)
                .background(SwiftUI.Color(UIColor.systemBackground))
                .cornerRadius(16)
                .shadow(color: SwiftUI.Color.black.opacity(0.05), radius: 8, y: 2)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("상품 목록")
                        .font(.headline)
                        .font(.system(size:20))
                        .foregroundColor(SwiftUI.Color.black)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing:12), count: 3), spacing: 15) {
                        ForEach(Categorys.keys.sorted(), id: \.self) { key in
                            CategoryItem(title: key, icon: Categorys[key]!)
                        }
                    }
                    .frame(width:361,height:225)

                }
                .padding(.top, 31)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("구매할 수 있는 상품")
                        .font(.headline)
                        .font(.system(size:20))
                        .foregroundColor(SwiftUI.Color.black)
                    ForEach(productList, id: \.self){ product in
                        ProductItem(product:product)
                    }
                    
                }
                .padding(.top,50)
            }
            .padding(.horizontal, 16)
        }
    }
}
struct CategoryItem: View {
    let title: String
    let icon: String
    var body: some View {
        VStack(spacing: 17) {
            HStack{
                Text(title)
                    .font(.subheadline)
                    .font(.system(size: 16))
                    .foregroundColor(SwiftUI.Color.black)
                Spacer()
            }
            HStack{
                Spacer()
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .foregroundColor(SwiftUI.Color.gray)
            }
        }
        .frame(width: 82, height: 71)
        .padding(.vertical, 12)
        .padding(.horizontal, 10)
        .background(SwiftUI.Color(UIColor.systemBackground))
        .cornerRadius(22)
        .shadow(color: SwiftUI.Color.black.opacity(0.05), radius: 2, y: 1)
    }
}

struct ProductItem: View {
    var product: Product
    var body: some View {
        HStack(spacing: 15) {
            Image(product.productImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .foregroundColor(SwiftUI.Color.green)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.productBrand)
                    .font(.subheadline)
                    .font(.system(size: 13))
                    .foregroundColor(SwiftUI.Color.gray)
                Text(product.productName)
                    .font(.headline)
                    .font(.system(size: 16))
                    .foregroundColor(SwiftUI.Color.black)
                HStack{
                    Image("Coin")
                        .resizable()
                        .frame(width:15,height:15)
                    Text("\(product.price)")
                        .font(.subheadline)
                        .font(.system(size: 14))
                        .foregroundColor(SwiftUI.Color.red)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 5) {
                Button(action: {}) {
                    Text("구매하기")
                        .font(.caption)
                        .font(.system(size: 14))
                        .padding(.horizontal, 11)
                        .padding(.vertical, 7)
                        .background(SwiftUI.Color.red.opacity(0.1))
                        .foregroundColor(SwiftUI.Color.red)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(SwiftUI.Color(UIColor.systemBackground))
        .cornerRadius(16)
        .shadow(color: SwiftUI.Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
#Preview
{
    ShopMainView()
}

