import SwiftUI

struct ShopView: View {
    var body: some View {
        VStack(spacing: 20) {
            // 코인 카드
            HStack {
              VStack(alignment: .leading, spacing: 5) {
                    Text("한걸음으로 이만큼이나 모았어요!")
                        .font(.subheadline)
                        .foregroundColor(SwiftUI.Color.red)
                    Text("나의 코인")
                        .font(.headline)
                        .foregroundColor(SwiftUI.Color.black)
                }
                Spacer()
                HStack(spacing: 5) {
                    Image(systemName: "bitcoinsign.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(SwiftUI.Color.yellow)
                    Text("2200")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(SwiftUI.Color.red)
                }
            }
            .padding()
            .background(SwiftUI.Color(UIColor.systemBackground))
            .cornerRadius(16)
            .shadow(color: SwiftUI.Color.black.opacity(0.05), radius: 4, x: 0, y: 2)

            // 상품 목록
            VStack(alignment: .leading, spacing: 15) {
                Text("상품 목록")
                    .font(.headline)
                    .foregroundColor(SwiftUI.Color.black)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 3), spacing: 12) {
                    CategoryItem(title: "식사", icon: "fork.knife")
                    CategoryItem(title: "영화", icon: "film")
                    CategoryItem(title: "생필품", icon: "toilet")
                    CategoryItem(title: "과자", icon: "gift")
                    CategoryItem(title: "카페", icon: "cup.and.saucer.fill")
                    CategoryItem(title: "화장품", icon: "lipstick")
                }
            }
            .padding(.horizontal)

            // 구매할 수 있는 상품
            
            .padding(.horizontal)

            Spacer()

            // 하단 탭바
            HStack(spacing: 40) {
                TabItem(title: "홈", icon: "house")
                TabItem(title: "미션", icon: "flag")
                TabItem(title: "상점", icon: "bag", isSelected: true)
                TabItem(title: "마이", icon: "person")
            }
            .padding(.vertical, 10)
            .background(SwiftUI.Color(UIColor.systemBackground))
            .shadow(color: SwiftUI.Color.black.opacity(0.05), radius: 4, x: 0, y: -2)
        }
        .padding(.top)
        .background(SwiftUI.Color(UIColor.systemGray6).ignoresSafeArea())
    }
}


struct TabItem: View {
    let title: String
    let icon: String
    var isSelected: Bool = false
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(isSelected ? SwiftUI.Color.red : SwiftUI.Color.gray)
            Text(title)
                .font(.caption)
                .foregroundColor(isSelected ? SwiftUI.Color.red : SwiftUI.Color.gray)
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
