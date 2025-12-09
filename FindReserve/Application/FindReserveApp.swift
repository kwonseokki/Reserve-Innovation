//
//  FindReserveApp.swift
//  FindReserve
//
//  Created by a on 11/5/25.
//

import SwiftUI
import SwiftData

@main
struct FindReserveApp: App {
    var container = try! ModelContainer(
        for: TrainingInfo.self,
        RideHistory.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: false)
    )
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .modelContext(container.mainContext)
        }
    }
}
