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
    private var container = try! ModelContainer(
        for: TrainingInfo.self,
        RideHistory.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: false)
    )
    @StateObject private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .modelContext(container.mainContext)
                .environmentObject(router)
        }
    }
}
