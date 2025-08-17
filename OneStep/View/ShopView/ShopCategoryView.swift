//
//  ShopCategoryView.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/17/25.
//

import SwiftUI

struct ShopCategoryView: View {
    @Binding var path: NavigationPath
    let myCoin:Int = 22000
    let productList: [Product] = mockProducts
    var categoryName: String 
    
    var sorting: [Int:String] = [1:"최신 등록순", 2:"많은 코인순", 3:"적은 코인순"]
    @State private var isExpanded = false
    @State var sortingKey: Int = 1
    
    var body: some View {
        ZStack(alignment: .topLeading) {
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
                        path.removeLast()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                    .frame(width:35,height:35)
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image("Coin")
                            .resizable()
                            .frame(width:19.5,height:19.5)
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
                
                
                HStack{
                    VStack(alignment:.center, spacing: 0) {
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
                        }
                        .padding(.top,13)
                        .padding(.bottom,5)
                        
                        if isExpanded {
                            let sortedKeys = sorting.keys.sorted()
                            VStack(alignment:.center, spacing: 0) {
                                ForEach(sortedKeys, id: \.self) { key in
                                    Button(action: {
                                        sortingKey = key
                                        withAnimation {
                                            isExpanded.toggle()
                                        }
                                    }) {
                                        Text(sorting[key]!)
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundColor(.black)
                                            .frame(width: 112, alignment: .center)
                                            .padding(.vertical,13)
                                    }
                                    .background(Color.white)
                                    
                                    if key != sortedKeys.last {
                                        Divider()
                                            .frame(width:112)
                                            .padding(0)
                                    }
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, y: 4)
                            .transition(.opacity)
                            .animation(.easeInOut, value: isExpanded)
                            .padding(.bottom)
                        }
                        
                    }
                    Spacer()
                }
            }
            .clipped()
        }
        .padding(.horizontal,20)
        .navigationBarBackButtonHidden(true)
    }
}


