//
//  CustomButtons.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import SwiftUI

struct ButtonWithForegroundAndBackgroundColorWithText: View {
    var buttonTitle: String
    var buttonForegroundColor: Color
    var buttonBackgroundColor: Color
    var buttonAction: (() -> Void)?
    
    var body: some View {
        Button(action: {
            buttonAction?()
        }, label: {
            Text(buttonTitle)
                .bold()
                .font(.custom("", size: 22))
                .frame(maxWidth: .infinity, minHeight: 47)
        })
        .foregroundColor(buttonForegroundColor)
        .background(buttonBackgroundColor)
        .cornerRadius(7)
    }
}
