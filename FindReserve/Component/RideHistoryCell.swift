//
//  RideHistoryCell.swift
//  FindReserve
//
//  Created by a on 12/9/25.
//

import SwiftUI

struct RideHistoryCell: View {
    let rideHistory: RideHistory
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                //            Text("\(rideHistory.createdAt)")
                Label("12월 15일 (월)", systemImage: "calendar.circle.fill")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    
                Spacer()
                Text(rideHistory.isPaymentCompleted ? "정산완료" : "미정산")
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(rideHistory.isPaymentCompleted ? .mint : .white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(rideHistory.isPaymentCompleted ? .main2 : .warning)
                    .cornerRadius(12)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Circle()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(.main)
                    VStack(alignment: .leading) {
                        Text(rideHistory.departure)
                            .font(.system(size: 14))
                    }
                    Spacer()
                }
                VStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 0.5, height: 15)
                        .foregroundStyle(.gray)
                }
                .frame(width: 15)
                HStack {
                    Circle()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(.button)
                    VStack(alignment: .leading) {
                        Text(rideHistory.destination)
                            .font(.system(size: 14))
                         
                    }
                    Spacer()
                }
            }
            HStack {
                Text("총 비용")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                Spacer()
                Text("\(rideHistory.amount)원")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
            }
            .padding(.top, 10)
        }
    }
}
