//
//  TrainingSelectionViewModel.swift
//  FindReserve
//
//  Created by a on 12/10/25.
//

import Foundation
import Combine
import SwiftData

class TrainingSelectionViewModel: ObservableObject {
    private var modelContext: ModelContext
    
    private var trainingInfoID: UUID?
    /// 훈련 종류
    @Published var selectedTrainingType: String = ""
    /// 훈련장
    @Published var selectedTrainingCenter: String = ""
    /// 훈련 종류 보임여부
    @Published var trainingDropDownIsOpen: Bool = false
    /// 훈련장 종류 보임여부
    @Published var trainingCenterDropDownIsOpen: Bool = false
    /// 훈련 종류 리스트
    @Published var trainingTypes: [TrainingType] = TrainingType.allCases
    /// 훈련장 종류 리스트
    @Published var trainingCenters: [String] = []
    /// 시작날짜
    @Published var startDate: Date = Date()
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchTrainingCenterInfo()
    }
    
    func fetchTrainingCenterInfo() {
        guard let path = Bundle.main.path(forResource: "kr-reserve-training-centers", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decodedData = try JSONDecoder().decode(TrainingCenterResponse.self, from: data)
            self.trainingCenters = decodedData.data.map { $0.trngcmp }
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    func fetchTrainingInfo() {
        do {
            let trainingList = try modelContext.fetch(FetchDescriptor<TrainingInfo>())
            if let myTrainingInfo = trainingList.first {
                selectedTrainingType = myTrainingInfo.trainingTypeValue
                trainingInfoID = myTrainingInfo.id
                selectedTrainingCenter = myTrainingInfo.departure
                startDate = myTrainingInfo.startDate
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveTrainingInfo() {
        do {
            let trainingList = try modelContext.fetch(FetchDescriptor<TrainingInfo>())
            if let myTrainingInfo = trainingList.first {
                myTrainingInfo.trainingTypeValue = selectedTrainingType
                myTrainingInfo.startDate = startDate
                myTrainingInfo.departure = selectedTrainingCenter
            } else {
                let trainingInfo = TrainingInfo(
                    id: trainingInfoID ?? UUID(),
                    trainingTypeValue: selectedTrainingType,
                    startDate: startDate,
                    departure: selectedTrainingCenter,
                    destination: ""
                )
                modelContext.insert(trainingInfo)
            }
            try modelContext.save()
        } catch {
            
        }
    }
}
