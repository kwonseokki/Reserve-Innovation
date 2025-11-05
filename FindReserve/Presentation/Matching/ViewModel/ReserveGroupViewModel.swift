//
//  ReserveGroupViewModel.swift
//  FindReserve
//
//  Created by a on 11/6/25.
//

import Combine

class ReserveGroupViewModel: ObservableObject {
    let reserves: [Reserve] = [
        Reserve(name: "예비군1", phone: "010-1234-5678", isPayer: false),
        Reserve(name: "예비군2", phone: "010-2345-6789", isPayer: true),
        Reserve(name: "예비군3", phone: "010-3456-7890", isPayer: false)
    ]
}
