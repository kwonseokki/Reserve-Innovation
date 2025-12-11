//
//  RideDetailView.swift
//  FindReserve
//
//  Created by a on 12/10/25.
//

import SwiftUI

struct RideDetailView: View {
    @StateObject var viewModel: RideDetailViewModel
    @EnvironmentObject var router: SecondTabRouter
    
    var body: some View {
        VStack {
            Spacer()
            
            if let rideHistory = viewModel.rideHistory {
                
                if !rideHistory.isPaymentCompleted {
                    VStack(spacing: 28) {
                        
                        // 타이틀 섹션
                        VStack(spacing: 8) {
                            Text("정산이 아직 완료되지 않았어요")
                                .font(.title2)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                            Text("내역을 확인한 후 정산을 진행해주세요.")
                                .font(.body)
                                .foregroundStyle(.gray)
                                .multilineTextAlignment(.center)
                        }
                        
                        
                        // 결제자 카드 정보
                        if let payUserInfo = rideHistory.payUserInfo {
                            CardContainerView {
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                    Text("결제 정보")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        HStack {
                                            Text("결제자")
                                                .foregroundStyle(.gray)
                                            Spacer()
                                            Text(payUserInfo.name)
                                                .fontWeight(.medium)
                                        }
                                        
                                        HStack {
                                            Text("핸드폰 번호")
                                                .foregroundStyle(.gray)
                                            Spacer()
                                            Text(payUserInfo.phone)
                                                .fontWeight(.medium)
                                        }
                                        
                                        HStack {
                                            Text("계좌번호")
                                                .foregroundStyle(.gray)
                                            Spacer()
                                            Text(payUserInfo.account)
                                                .fontWeight(.medium)
                                        }
                                    }
                                    .padding(.top, 4)
                                }
                                .padding(.horizontal, 4)
                            }
                        }
                        
                        // 정산 버튼
                        if let _ = rideHistory.payUserInfo {
                            Button {
                                viewModel.completePayment()
                            } label: {
                                Text("\(rideHistory.amount)원 정산하기")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 14)
                            }
                            .background(.button)
                            .cornerRadius(12)
                            .padding(.top, 12)
                        }
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                    
                } else {
                    
                    // 정산 완료 화면
                    VStack(spacing: 16) {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.green)
                        
                        Text("정산이 완료되었습니다.")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                    }
                }
                
            } else {
                Text("문제가 발생했습니다.")
                    .foregroundStyle(.red)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.customBackground)
        .navigationTitle(Text("이용 내역"))
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BackButton(action: {
            router.pop()
        }))
    }
}
