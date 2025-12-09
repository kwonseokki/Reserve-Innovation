//
//  MatchingViewModel.swift
//  FindReserve
//
//  Created by a on 11/11/25.
//

import Foundation
import Combine
import SwiftData

class MatchingViewModel: ObservableObject {
    private var modelContext: ModelContext
    @Published var myTrainingInfo: TrainingInfo?
    @Published var userName = ""
    
    func getUserInfo() {
        if let user = KeyChainManager.getUser() {
            self.userName = user.name
        }
    }
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func fetchTrainingInfo() {
        do {
            let trainingList = try modelContext.fetch(FetchDescriptor<TrainingInfo>())
            if let myTrainingInfo = trainingList.first {
                self.myTrainingInfo = myTrainingInfo
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
