//
//  MatchListViewModel.swift
//  FindReserve
//
//  Created by a on 11/6/25.
//

import Combine
import SwiftData
import Foundation

class MatchListViewModel: ObservableObject {
    private var modelContext: ModelContext
    
    @Published var rideHistory: [RideHistory] = []
    
    @MainActor init(modelContext: ModelContext) {
        self.modelContext = modelContext
        self.fetchRideHistory()
    }
    
    func fetchRideHistory() {
        do {
           rideHistory = try modelContext.fetch(FetchDescriptor<RideHistory>())
        } catch {
            print(error.localizedDescription)
        }
    }
}
