//
//  TrainingCenter.swift
//  FindReserve
//
//  Created by a on 12/10/25.
//

import Foundation

struct TrainingCenterResponse: Codable {
    let description: TrainingCenterDescription
    let data: [TrainingCenter]

    enum CodingKeys: String, CodingKey {
        case description = "DESCRIPTION"
        case data = "DATA"
    }
}

// MARK: - Description (필드 설명)
struct TrainingCenterDescription: Codable {
    let trngcmp: String
    let gungu: String
    let attmpt: String
    let addr: String
    let rghmap: String
    let type: String
    let shape: String
    let knd: String
    let telno: String
}

// MARK: - 실제 데이터 구조
struct TrainingCenter: Codable, Identifiable {
    var id = UUID()

    let trngcmp: String      // 훈련장 이름
    let gungu: String        // 군구
    let attmpt: String       // 시/도
    let addr: String         // 주소
    let rghmap: String       // 약도 URL
    let type: String         // 훈련장유형
    let shape: String        // 훈련장형태
    let knd: String          // 훈련장종류
    let telno: String        // 전화번호

    enum CodingKeys: String, CodingKey {
        case trngcmp, gungu, attmpt, addr, rghmap, type, shape, knd, telno
    }
}
