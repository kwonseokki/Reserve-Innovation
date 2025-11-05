//
//  DestinationView.swift
//  FindReserve
//
//  Created by a on 11/5/25.
//

import SwiftUI
import MapKit

struct DestinationView: View {
    @StateObject var viewModel = DestinationViewModel()
    @StateObject var router = MatchingRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                HStack {
                    TextField("", text: $viewModel.searchText)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        
                    } label: {
                        Text("검색")
                    }
                }
                .padding(4)
                Map(coordinateRegion: $viewModel.region)
            }
            .overlay(alignment: .bottom) {
                CustomButton(text: "설정 완료") {
                    router.push(.mathcing)
                }
                .padding()
                .navigationDestination(for: Route.self) { destination in
                    switch destination {
                    case .mathcing:
                        FindReserveView()
                    case .reserveGroup:
                        ReserveGroupView(viewModel: ReserveGroupViewModel())
                    case .requestPayment:
                        RequestPaymentView()                    
                    }
                }
            }
        }
        .environmentObject(router)
    }
}

#Preview {
    DestinationView()
}
