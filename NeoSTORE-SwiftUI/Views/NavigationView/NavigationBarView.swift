//
//  NavigationView.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 25/07/22.
//

import SwiftUI

enum LeftNavigationButton {
    case sideMenu
    case back
    
    var iconName: String {
        switch self {
            case .sideMenu: return "menu_icon"
            case .back: return "back_icon"
        }
    }
}

enum RightNavigationButton {
    case search
    case addNew
    
    var iconName: String {
        switch self {
            case .search: return "search_icon"
            case .addNew: return "Plus"
        }
    }
}

struct NavigationBarView: View {
    let leftNavigationButton: LeftNavigationButton
    let rightNavigationButton: RightNavigationButton
    let leftNavigationButtonAction: (() -> Void)?
    let rightNavigationButtonAction: (() -> Void)?
    
    var body: some View {
        HStack{
            Button {
                leftNavigationButtonAction?()
            } label: {
                Image(leftNavigationButton.iconName)
            }
            .padding(.leading, 8)
            .frame(height: UIScreen.main.bounds.size.height*0.08)
            
            Spacer()
            
            Text("NeoSTORE")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .frame(height: UIScreen.main.bounds.height*0.08)
            
            Spacer()
            
            Button {
                rightNavigationButtonAction?()
            } label: {
                Image(rightNavigationButton.iconName)
            }
            .padding(.trailing, 8)
            .frame(height: UIScreen.main.bounds.height*0.08)
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.height*0.08)
        .background(Color.appRed)
    }
}
