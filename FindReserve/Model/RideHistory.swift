//
//  RideHistory.swift
//  FindReserve
//
//  Created by a on 12/9/25.
//

import Foundation

struct RideHistory: Identifiable {
    let id: UUID = UUID()            // 고유 ID
    let departure: String            // 출발지
    let destination: String          // 도착지
    let isPaymentCompleted: Bool     // 결제 완료 여부
    let createdAt: Date              // 생성일
    
    // 필요하면 편의 초기화
    init(departure: String, destination: String, isPaymentCompleted: Bool, createdAt: Date = Date()) {
        self.departure = departure
        self.destination = destination
        self.isPaymentCompleted = isPaymentCompleted
        self.createdAt = createdAt
    }
}
