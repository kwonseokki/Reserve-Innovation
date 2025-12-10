//
//  MatchListView.swift
//  FindReserve
//
//  Created by a on 11/5/25.
//

import SwiftUI

struct MatchListView: View {
    @StateObject var viewModel: MatchListViewModel
    @EnvironmentObject var router: SecondTabRouter
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("정산 내역")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("동승한 내역을 확인하세요")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                .padding()
                
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.rideHistory, id:\.self.id) { item in
                            CardContainerView {
                                Button {
                                    router.push(.rideDetail(id: item.id))
                                } label: {
                                    RideHistoryCell(rideHistory: item)
                                }
                                .accentColor(.black)
                            }
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                viewModel.fetchRideHistory()
            }
            .navigationDestination(for: SecondTabRoute.self) { destination in
                switch destination {
                case .rideDetail(let id):
                    RideDetailView(viewModel: RideDetailViewModel(modelContext: modelContext, id: id))
                }
            }
        }
    }
}
