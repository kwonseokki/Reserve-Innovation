//
//  SecondTabRouter.swift
//  FindReserve
//
//  Created by a on 12/10/25.
//

import SwiftUI
import Combine
import MapKit

enum ThirdRouter: Hashable, Identifiable {
    var id: Self { self }
    case editProfile
}

class ThirdTabRouter: ObservableObject {
    @Published var path: [ThirdRouter] = []
    @Published var fullScreenPath: [ThirdRouter] = []
    @Published var fullScreenCover: ThirdRouter?
    @Published var dismissTrigger = false
    
    func push(_ route: ThirdRouter) {
        if let fullScreenCover {
            fullScreenPath.append(route)
        } else {
            path.append(route)
        }
    }
    
    func pop() {
        path.popLast()
    }
    
    func popToRoot() {
        path.removeAll()
        dismissTrigger = false
    }
    
    func dismiss() {
        fullScreenCover = nil
    }
    
    func presentFullScreen(_ route: ThirdRouter) {
        fullScreenCover = route
    }
}
