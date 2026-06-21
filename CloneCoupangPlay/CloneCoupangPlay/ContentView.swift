import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MainViewModel() // 메인뷰모델 불러오기
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.ignoresSafeArea() // 노치부분까지 검정색으로
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    
                    // 상단 네비게이션
                    HStack {
                        Text("coupang play")
                            .foregroundStyle(.blue)
                            .font(.title2)
                            .bold()
                        Spacer()
                        Text("카테고리")
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal)
                    
                    // 메뉴
                    HStack(spacing: 20) {
                        Text("TV")
                        Text("영화")
                        Text("스포츠")
                        Text("스토어")
                        Text("키즈")
                    }
                    .foregroundStyle(.white)
                    
                    // 메인 배너
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(viewModel.mainPosters, id: \.name) { mainPoster in
                                ZStack(alignment: .bottom) {
                                    Image(mainPoster.name)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 380, height: 500)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                        .overlay {
                                            LinearGradient( //아래로 갈수록 어두워지는 그라데이션 효과 만들기
                                                colors: [.clear, .black.opacity(0.3), .black.opacity(0.8)],
                                                startPoint: .center,
                                                endPoint: .bottom
                                            )
                                        }
                                    
                                    
                                        Text("오늘 오후 8시 예매하기")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundStyle(.white)
                                            .frame(width: 340, height: 50)
                                            .background(Color.blue)
                                            .cornerRadius(8)
                                            .padding(.bottom, 30)
                                }.containerRelativeFrame(.horizontal)
                            }
                        }
           
                    }
        
                    
                    // 조그마한 배너
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 5) {
                            ForEach(viewModel.smallContents, id: \.self) { smallContent in
                                Image(smallContent)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // 이번주 인기작 TOP20
                    VStack(alignment: .leading) {
                        Text("이번주 인기작 TOP20   >")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(0..<viewModel.topContents.count, id: \.self) { rank in
                                    ZStack(alignment: .bottomLeading) {
                                        Image(viewModel.topContents[rank].name)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 120, height: 170)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .padding(5)
                                            .overlay(alignment: .topLeading) {
                                                switch viewModel.topContents[rank].genre {
                                                case .movie: Image("propertyMovie")
                                                case .series: Image("propertySeries")
                                                default: EmptyView()
                                                }
                                            }
                                        
                                        Text("\(rank + 1)") //가져온 이미지 순서대로 순차적으로 순위매기기
                                            .font(Font.system(size: 80, weight: .bold))
                                            .foregroundStyle(.white)
                                            .opacity(0.8)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // 긴 배너
                    Image("longbanner")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 380, height: 150)
                    
                    // 새로 올라온 콘텐츠
                    VStack(alignment: .leading) {
                        Text("새로 올라온 콘텐츠   >")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(viewModel.newContents, id: \.name) { newContent in
                                    Image(newContent.name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 170)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .padding(.horizontal, 5)
                                        .overlay(alignment: .topLeading) {
                                            switch newContent.genre {
                                            case .movie: Image("propertyMovie")
                                            case .series: Image("propertySeries")
                                            default: EmptyView()
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // 경제로 보는 세상
                    VStack(alignment: .leading) {
                        Text("경제로 보는 세상   >")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(viewModel.economyContents, id: \.self) { economyContent in
                                    Image(economyContent)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 170)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .padding(.horizontal, 5)
                                        .overlay(alignment: .topLeading) {
                                            Image("propertyEbs")
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.bottom, 100)
            }
            
            // 하단 탭바
            Image("underTapbar")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea(edges: .bottom)
                .frame(width: 400, height: 80)
                .background(.black)
        }
    }
}
