//
//  TrainingSelectionView.swift
//  FindReserve
//
//  Created by a on 12/10/25.
//

import SwiftUI

struct TrainingSelectionView: View {
    @StateObject var viewModel: TrainingSelectionViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    
                    // 훈련 종류
                    CustomDropdown(
                        title: "훈련 종류",
                        selection: $viewModel.selectedTrainingType,
                        isExpanded: $viewModel.trainingDropDownIsOpen,
                        list: viewModel.trainingTypes.map { $0.rawValue }
                    )
                    .frame(maxHeight: 300)
                    
                    // 날짜 선택
                    VStack(alignment: .leading, spacing: 6) {
                        Text("날짜")
                            .font(.headline)

                        DatePicker("", selection: $viewModel.startDate, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color(.secondarySystemBackground))
                            )
                    }
                    
                    // 훈련장 선택
                    CustomDropdown(
                        title: "훈련장 선택",
                        selection: $viewModel.selectedTrainingCenter,
                        isExpanded: $viewModel.trainingCenterDropDownIsOpen,
                        list: viewModel.trainingCenters
                    )
                    .frame(maxHeight: 300)
                    Spacer()
                }
                .padding(.top, 30)
            }
            
            CustomButton(text: "설정 완료") {
                viewModel.saveTrainingInfo()
                dismiss()
            }
        }
        .padding(.horizontal, 16)
        .onAppear {
            viewModel.fetchTrainingInfo()
        }
    }
}


