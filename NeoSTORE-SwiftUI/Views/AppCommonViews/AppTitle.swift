//
//  AppTitle.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 28/07/22.
//

import SwiftUI

struct AppTitleView: View {
    let title: String = "NeoSTORE"
    var body: some View {
        Text(title)
            .font(.custom("", size: 45))
            .foregroundColor(.white)
            .bold()
            .padding(EdgeInsets(top: UIScreen.main.bounds.size.height * 0.08, leading: 0, bottom: 30, trailing: 0))
    }
}
