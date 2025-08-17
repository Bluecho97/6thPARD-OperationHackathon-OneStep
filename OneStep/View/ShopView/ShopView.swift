//
//  ShopView.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/17/25.
//

import SwiftUI

class PurchaseManager: ObservableObject {
    @Published var isShowingPurchase = false
    @Published var product: Product? = nil
}

struct ShopView: View {
    
    @State private var path = NavigationPath()
    @StateObject var purchaseManager = PurchaseManager()
    var body: some View {
        ZStack{
            NavigationStack(path:$path){
                ShopMainView(path:$path)
                    .navigationDestination(for: String.self) { item in
                        ShopCategoryView(path:$path, categoryName: item)
                    }
            }
            if purchaseManager.isShowingPurchase {
                PurchaseModal()
            }
            
        }
        .environmentObject(purchaseManager)
    }
}




struct ProductItem: View {
    var product: Product
    @EnvironmentObject var purchaseManager: PurchaseManager
    
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
                Button(action: {
                    purchaseManager.isShowingPurchase = true
                    purchaseManager.product = product
                }) {
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
    }
}


struct PurchaseModal: View {
    @EnvironmentObject var purchaseManager: PurchaseManager
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5) // 반투명 배경
                .ignoresSafeArea()
                .onTapGesture {
                    purchaseManager.isShowingPurchase = false
                }
            
            VStack{
                VStack(spacing: 16) {
                    Text(purchaseManager.product!.productBrand)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(purchaseManager.product!.productName)
                        .font(.headline)
                        .bold()
                    
                    Image(purchaseManager.product!.productImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 180)
                    
                    HStack(spacing: 4) {
                        Image("Coin") // 코인 이미지
                            .foregroundColor(.yellow)
                        Text("\(purchaseManager.product!.price)")
                            .bold()
                            .foregroundColor(.orange)
                    }
                    .padding(8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    
                    Text("해당 쿠폰을 구매하시겠어요?")
                        .font(.footnote)
                        .foregroundColor(.red)
                    
                    Button(action: {
                        print("구매 완료!")
                    }) {
                        Text("구매하기")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                }
                .frame(width:360, height:520)
                .background(.white)
                
                Button("뒤로 돌아가기") {
                    purchaseManager.isShowingPurchase = false
                }
                .foregroundColor(.gray)
                .padding(.top, 4)
            }
            .padding()
        }
        .animation(.easeInOut, value: purchaseManager.isShowingPurchase)
        .transition(.opacity)
    }
}
#Preview {
    ShopView()
}
