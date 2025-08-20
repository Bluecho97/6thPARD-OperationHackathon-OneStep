import SwiftUI

struct MyView: View {
    @Binding var path:NavigationPath
    
    @ObservedObject var manager = CouponManager()
    @ObservedObject var infoManager = InfoManager()
    @StateObject private var viewModel = MyViewModel()
    
    let appleToken = UserDefaults.standard.string(forKey: "appleToken") ?? ""
    let name = UserDefaults.standard.string(forKey: "appleUserName") ?? "사용자"
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment:.top){
                Color(.systemGroupedBackground).ignoresSafeArea()
                VStack(spacing: 0) {
                    if let mission = viewModel.missionDays {
                        VStack(alignment: .leading, spacing: 00) {
                            Text("오늘도 한걸음 더 나아가는 멋진 당신!")
                                .font(.caption)
                                .foregroundColor(.red)
                            
                            Text("\(name)님")
                                .font(.title2)
                                .bold()
                                .padding(.top,8)
                            
                            HStack {
                                Text("미션 완료 일수")
                                    .font(.system(size:15))
                                    .foregroundColor(.gray)
                                Button{
                                    infoManager.showInfo = true
                                } label: {
                                    VStack{
                                        Image("Info")
                                            .resizable()
                                            .frame(width:18,height:18)
                                    }
                                }
                                Spacer()
                                Text("+\(mission.missionCompletionDays)일째")
                                    .font(.system(size:15))
                                    .foregroundColor(.red)
                                    .bold()
                            }
                            .padding(.horizontal,18)
                            .padding(.vertical,16)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.top,32)
                        }
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                        .padding(.horizontal,20)
                    } else if viewModel.isLoading {
                        ProgressView("로딩 중...")
                    }
                    
                    
                    VStack(alignment: .leading,spacing: 0) {
                        HStack {
                            Text("상품 쿠폰 저장함")
                                .font(.headline)
                            Spacer()
                            Button("전체보기") {
                                path.append("CouponStorage")
                            }
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        }
                        .padding(.horizontal,20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(viewModel.coupons, id: \.id) { coupon in
                                    CouponButton(coupon:coupon, manager:manager)
                                }
                            }
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                    }
                    .padding(.top,40)
                    
                    VStack(alignment:.leading, spacing: 0) {
                        Text("이용 안내")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.top,40)
                            .padding(.horizontal,20)
                        SettingsCardView()
                        
                    }
                    
                }
                
            }
            .navigationDestination(for: String.self) { item in
                if item == "CouponStorage" {
                    CouponStorageView(path:$path, viewModel: viewModel, manager: manager)
                }
            }
            .task {
                await viewModel.fetchMissionDays(appleToken: appleToken)
                await viewModel.fetchCoupons(appleToken: appleToken)
            }
            .onChange(of: path.count) { newCount in
                if newCount == 0 { // CouponStorageView에서 돌아왔을 때
                    Task {
                        await viewModel.fetchMissionDays(appleToken: appleToken)
                        await viewModel.fetchCoupons(appleToken: appleToken)
                    }
                }
            }
        }
        
    }
}

struct CouponButton: View {
    let coupon: Coupon
    @ObservedObject var manager: CouponManager
    
    var body: some View {
        Button {
            manager.selectCoupon(coupon)
        } label: {
            VStack {
                Image(coupon.productImageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
            }
            .frame(width: 122, height: 130)
            .background(.white)
            .cornerRadius(20)
        }
    }
}


// MARK: - 쿠폰 상세 모달
struct CouponModal: View {
    let coupon: Coupon
    @ObservedObject var manager: CouponManager
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.5) // 반투명 배경
                .ignoresSafeArea()
                .onTapGesture {
                    manager.showModal = false
                }
            
            VStack(spacing: 16) {
                Text("상품 쿠폰 저장함")
                    .font(.headline)
                    .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text(coupon.brandName)
                        .font(.subheadline)
                    Text(coupon.productName)
                        .font(.title3)
                        .bold()
                }
                
                ZStack{
                    Rectangle()
                        .frame(width: 270,height:256)
                        .foregroundColor(.gray.opacity(0.2))
                        .cornerRadius(15)
                    
                    Image(coupon.productImageUrl)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 170, height: 108)
                        .cornerRadius(12)
                        .frame(width:200,height:200)
                }
                
                Image(systemName: "barcode")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .padding(.horizontal, 40)
                
                Spacer()
            }
            .frame(width:360,height:488)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal,16)
        }
    }
}

struct InfoModal: View {
    @ObservedObject var manager: InfoManager
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.5) // 반투명 배경
                .ignoresSafeArea()
                .onTapGesture {
                    manager.showInfo = false
                }
            
            VStack(spacing: 20) {
                // 제목
                VStack(spacing: 8) {
                    Text("미션 완료 일수가 무엇인가요?")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    
                    Text("하루에 나오는 미션을 완료한 일수를 말해요!\n완료 일수가 3주(= 21일)이 되었을 때는\n🔶 더 큰 금액의 미션이 제공돼요!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                // 미션 완료 안내 박스
                Text("21일동안 미션 완료!")
                    .font(.subheadline)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                // 달력 이미지 대체
                Image("coffee") // ← 달력 대신 쓸 이미지 이름
                    .resizable()
                    .scaledToFit()
                    .frame(width: 260, height: 180)
                    .cornerRadius(12)
                
                // 버튼
                Button {
                    manager.showInfo = false
                } label: {
                    Text("돌아가기")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(12)
                }
            }
            .padding()
            .frame(width: 320)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
    
}

struct SettingsCardView: View {
    var body: some View {
        VStack(spacing: 0) {
            settingRow(title: "개인정보 처리방침")
            Divider()
            settingRow(title: "서비스 이용 약관")
            Divider()
            settingRow(title: "로그아웃")
        }
        .background(Color.white)
        .cornerRadius(16)
        .padding()
    }
    
    @ViewBuilder
    private func settingRow(title: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 20)
    }
}
//
//#Preview {
//    MyView()
//}
