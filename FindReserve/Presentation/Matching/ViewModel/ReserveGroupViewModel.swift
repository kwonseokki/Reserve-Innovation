//
//  ReserveGroupViewModel.swift
//  FindReserve
//
//  Created by a on 11/6/25.
//

import Combine
import Foundation

class ReserveGroupViewModel: ObservableObject {
    let reserves: [Reserve] = [
        Reserve(name: "예비군1", phone: "010-1234-5678", isPayer: false),
        Reserve(name: "예비군2", phone: "010-2345-6789", isPayer: true),
        Reserve(name: "예비군3", phone: "010-3456-7890", isPayer: false)
    ]
    private let connectivityManager = ConnectivityManager.shared
    @Published var sessionCompleted = false
    
    var connectedPeers: Int {
        connectivityManager.connectedPeerCount
    }
    
    init() {
        observeConnectedPeers()
    }
    
    func observeConnectedPeers() {
        connectivityManager.receivedData = { [weak self] data in
            print(data, "받음")
            DispatchQueue.main.async {
                self?.sessionCompleted = true
            }
        }
    }
    
    func requestPayment(_ completion: @escaping () -> Void) {
        do {
            let data = try JSONEncoder().encode("testttt")
            try connectivityManager.sendData(data)
            completion()
        } catch {
            
        }
    }
}
