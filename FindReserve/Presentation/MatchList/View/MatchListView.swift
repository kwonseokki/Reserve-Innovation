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
                
                if viewModel.rideHistory.isEmpty {
                    VStack(spacing: 16) {
                        Spacer()
                        Image(systemName: "text.page.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.gray)
                        
                        Text("조회할 정산 내역이 없습니다.")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                } else {
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
