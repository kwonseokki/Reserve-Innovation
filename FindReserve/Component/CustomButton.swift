//
//  CustomButton.swift
//  FindReserve
//
//  Created by a on 11/6/25.
//

import SwiftUI

struct CustomButton: View {
    let text: String
    var action: (()->())?
    
    var body: some View {
        Button(action: {
        }) {
            Text(text)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.main)
            .foregroundColor(.white)
            .cornerRadius(16)
        }
    }
}

#Preview {
    CustomButton(text: "매칭시작")
}
