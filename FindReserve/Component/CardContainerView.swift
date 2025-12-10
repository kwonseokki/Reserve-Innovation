//
//  CardContainerView.swift
//  FindReserve
//
//  Created by a on 12/10/25.
//

import SwiftUI

struct CardContainerView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
            )            
    }
}
