//
//  SettingView.swift
//  FindReserve
//
//  Created by a on 11/5/25.
//

import SwiftUI
import SwiftData

struct SettingView: View {
    @StateObject var viewModel = SettingViewModel()
    @EnvironmentObject var router: ThirdTabRouter
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack(alignment: .leading) {
                Text("마이페이지")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                // 내 프로필
                CardContainerView {
                    HStack {
                        Image(.profile)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.main)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(viewModel.name)
                                .fontWeight(.bold)
                            Text("예비역")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
                .padding()
                
                // 계좌정보
                VStack(alignment: .leading) {
                    Text("계좌 정보")
                        .fontWeight(.semibold)
                    CardContainerView {
                        HStack(spacing: 10) {
                            Image(systemName: "creditcard")
                                .foregroundStyle(.main)
                            VStack(alignment: .leading) {
                                Text("은행명")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                Text("\(viewModel.account)")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 14))
                            }
                            Spacer()
                        }
                    }
                }
                .padding()
                
                // 프로필 수정
                VStack(alignment: .leading) {
                    Text("설정")
                        .fontWeight(.semibold)
                    CardContainerView {
                        Button {
                            router.push(.editProfile)
                        } label: {
                            HStack {
                                Label("프로필 수정", systemImage: "person")
                                    .foregroundStyle(.gray)
                                    .fontWeight(.semibold)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }

                    }
                }
                .padding()
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(.customBackground)
            .navigationDestination(for: ThirdRouter.self) { destination in
                switch destination {
                case .editProfile:
                    EditView(viewModel: viewModel)
                }
            }
        }
        .onAppear {
            viewModel.getUserInfo()
        }
    }
}
