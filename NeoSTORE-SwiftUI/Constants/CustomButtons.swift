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
    var buttonAction: () -> Void
    
    var body: some View {
        Button(action: {
            buttonAction()
        }, label: {
            Text(buttonTitle)
                .font(.custom("", size: 22))
                .bold()
                .padding(5)
        })
        .frame(maxWidth: .infinity, minHeight: 48)
        .foregroundColor(buttonForegroundColor)
        .background(buttonBackgroundColor)
        .padding(EdgeInsets(top: 33, leading: 33, bottom: 21, trailing: 33))
    }
}