//
//  Reserve.swift
//  FindReserve
//
//  Created by a on 11/6/25.
//

import Foundation

struct Reserve: Identifiable, Codable {
        let id = UUID()
        let name: String
        let phone: String
        let isPayer: Bool
}
