//
//  Date+.swift
//  FindReserve
//
//  Created by a on 12/11/25.
//

import Foundation

extension Date {
        
    func toYYYYMMDD() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 M월 d일"
        return formatter.string(from: self)
    }
        
    func toMMDD() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "M월 d일"
        return formatter.string(from: self)
    }
}
