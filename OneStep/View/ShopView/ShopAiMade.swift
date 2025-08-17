//
//  ShopClaudeMade.swift
//  OneStep
//
//  Created by Kim Kyengdong on 8/16/25.
//

import SwiftUI

struct ShopClaudeMadeView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Main content
            ScrollView {
                VStack(spacing: 20) {
                    // Coin section
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("한컵음으로 이만큼이나 모았어요!")
                                .font(.caption)
                                .foregroundColor(.red)
                            Spacer()
                        }
                        
                        HStack {
                            Text("나의 코인")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            HStack(spacing: 4) {
                                Text("2200")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    // Divider
                    Rectangle()
                        .frame(height: 8)
                    
                    // Categories section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("상품 목록")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        // Category grid
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
                            CategoryItem(icon: "fork.knife", title: "식사")
                            CategoryItem(icon: "video.fill", title: "영화")
                            CategoryItem(icon: "tshirt.fill", title: "생필품")
                            CategoryItem(icon: "gift.fill", title: "과자")
                            CategoryItem(icon: "cup.and.saucer.fill", title: "카페")
                            CategoryItem(icon: "paintbrush.fill", title: "화장품")
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    // Available products section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("구매할 수 있는 상품")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        // Product item
                        HStack(spacing: 12) {
                            // Starbucks logo placeholder
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Text("★")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                )
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("스타벅스")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text("아이스아메리카노")
                                    .font(.body)
                                    .fontWeight(.medium)
                                HStack(spacing: 4) {
                                    Circle()
                                        .frame(width: 16, height: 16)
                                    Text("2000")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                }
                            }
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Text("구매하기")
                                    .font(.caption)
                                    .foregroundColor(.red)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 6)
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                    )
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // Second product item placeholder
                        HStack(spacing: 12) {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 60, height: 60)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("에뛰드")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text("틴트00인 립틴트")
                                    .font(.body)
                                    .fontWeight(.medium)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    Spacer(minLength: 100)
                }
            }
            
            // Bottom tab bar
            HStack {
                TabBarItem(icon: "house", title: "홈", isSelected: false)
                TabBarItem(icon: "clock", title: "미션", isSelected: false)
                TabBarItem(icon: "bag", title: "상점", isSelected: true)
                TabBarItem(icon: "person", title: "마이", isSelected: false)
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .padding(.bottom, 8)
            .overlay(
                Rectangle()
                    .frame(height: 0.5),
                alignment: .top
            )
        }
    }
}

struct CategoryItem: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 80, height: 80)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 32))
                        .foregroundColor(.gray)
                )
                .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 1)
            
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.black)
        }
    }
}

struct TabBarItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(isSelected ? .red : .gray)
            Text(title)
                .font(.caption2)
                .foregroundColor(isSelected ? .red : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview{
    ShopClaudeMadeView()
}
