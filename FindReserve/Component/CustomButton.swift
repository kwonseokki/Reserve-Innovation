//
//  CustomButton.swift
//  FindReserve
//
//  Created by a on 11/6/25.
//

import SwiftUI

struct CustomButton: View {
    let text: String
    var icon: Image? = nil
    var action: (()->())?
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            Label(title: {
                Text(text)
            }, icon: {
                if let icon {
                    icon
                        .resizable()
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fit)
                }
            })
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(.main)
            .foregroundColor(.black)
            .fontWeight(.semibold)
            .cornerRadius(20)
        }
    }
}

#Preview {
    CustomButton(text: "매칭시작")
}
