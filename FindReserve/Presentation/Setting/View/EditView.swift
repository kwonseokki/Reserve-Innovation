//
//  EditView.swift
//  FindReserve
//
//  Created by a on 12/11/25.
//

import SwiftUI

struct EditView: View {
    @ObservedObject var viewModel: SettingViewModel
    
    var body: some View {
        Form {
            Section(header: Text("내 정보")) {
                TextField("이름", text: $viewModel.name)
                TextField("전화번호", text: $viewModel.phoneNumber)
                    .keyboardType(.phonePad)
                TextField("계좌번호", text: $viewModel.account)
                    .keyboardType(.numberPad)
            }
            
            Section {
                Button(action: {
                    viewModel.saveUserInfo()
                }) {
                    Text("저장")
                        .foregroundColor(.blue)
                }
            }
        }
        .onAppear {
            viewModel.getUserInfo()
        }
    }
}

