//
//  RequestPaymentView.swift
//  FindReserve
//
//  Created by a on 11/6/25.
//

import SwiftUI

import SwiftUI

struct RequestPaymentView: View {
    @StateObject var viewModel: RequestPaymentViewModel
    @EnvironmentObject var router: FirstTabRouter
    @State private var isShowCopyAccountToast = false
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            if viewModel.isHost {
                Image(.checkIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
            } else {
                Image(.card)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            
            
            Text(viewModel.isHost ? "정산 요청을 완료했어요!" : "정산 요청이 도착했어요!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 16)
            
                Text("\(viewModel.payUserInfo?.name ?? "예비군")님이 정산을 요청했습니다.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
            
            // 금액
            Text("\(viewModel.amount)원")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.blue)
                .padding(.top, 16)
            
            // 결제자 정보
            if viewModel.isHost {
                
            } else {
                CardContainerView {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            if let payUserInfo = viewModel.payUserInfo {
                                Text("결제자: \(payUserInfo.name)")
                                    .fontWeight(.semibold)
                                Text("핸드폰 번호: \(payUserInfo.phone)")
                                    .fontWeight(.semibold)
                                Text("계좌번호: \(payUserInfo.account)")
                                    .fontWeight(.semibold)
                            }
                        }
                        Spacer()
                        Button(action: {
                            UIPasteboard.general.string = viewModel.payUserInfo?.account
                            isShowCopyAccountToast = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                isShowCopyAccountToast = false
                            }
                        }) {
                            Image(systemName: "doc.on.doc")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
            
            
            Spacer()
            
            CustomButton(text: "정산 완료") {
                viewModel.completePayment()
                router.dismissTrigger = true
            }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
        }
        .navigationBarBackButtonHidden(true)
        .background(.customBackground)
        .overlay(
            // 계좌복사 완료 토스트
            Group {
                if isShowCopyAccountToast {
                    Text("계좌번호 복사 완료")
                        .font(.caption)
                        .padding(10)
                        .background(Color.black.opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .transition(.opacity)
                        .animation(.easeInOut, value: isShowCopyAccountToast)
                        .padding(.bottom, 150)
                }
            },
            alignment: .bottom
        )
    }
}
