//
//  RootView.swift
//  FindReserve
//
//  Created by a on 11/5/25.
//

import SwiftUI

struct RootView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var router: Router
    
    var body: some View {
        NavigationStack(path: $router.path) {
            TabView {
                MatchingView(viewModel: MatchingViewModel(modelContext: modelContext))
                    .tabItem {
                        Image(systemName: "person.line.dotted.person")
                        Text("매칭")
                    }
                
                MatchListView(viewModel: MatchListViewModel(modelContext: modelContext))
                    .tabItem {
                        Image(systemName: "list.clipboard")
                        Text("정산 내역")
                    }
                
                SettingView()
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("설정")
                    }
            }
            .navigationDestination(for: Route.self) { destination in
                switch destination {
                case .mathcing:
                    FindReserveView()
                case .reserveGroup:
                    ReserveGroupView(viewModel: ReserveGroupViewModel(modelContext: modelContext))
                case .requestPayment(let amount):
                    RequestPaymentView(viewModel: RequestPaymentViewModel(amount: amount, modelContext: modelContext))
                case .training:
                    TrainingSelectionView(viewModel: TrainingSelectionViewModel(modelContext: modelContext))
                }
            }
        }
    }
}

#Preview {
    RootView()
}
