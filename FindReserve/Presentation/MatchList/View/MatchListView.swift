//
//  MatchListView.swift
//  FindReserve
//
//  Created by a on 11/5/25.
//

import SwiftUI

struct MatchListView: View {
    @StateObject var viewModel: MatchListViewModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        NavigationStack(path: $router.path) {
            List(viewModel.rideHistory) { item in
                RideHistoryCell(rideHistory: item)
            }
            .onAppear {
                viewModel.fetchRideHistory()
            }
        }
    }
}
