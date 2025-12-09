//
//  MatchListView.swift
//  FindReserve
//
//  Created by a on 11/5/25.
//

import SwiftUI

struct MatchListView: View {
    @StateObject var viewModel: MatchListViewModel

    var body: some View {
            List(viewModel.rideHistory) { item in
               RideHistoryCell(rideHistory: item)
            }
            .onAppear {
                viewModel.fetchRideHistory()
            }            
        
    }
}
