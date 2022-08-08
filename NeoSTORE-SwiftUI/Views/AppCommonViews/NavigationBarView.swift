//
//  NavigationView.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 25/07/22.
//

import SwiftUI

enum NavigationButtonItem {
    case sideMenu
    case back
    case search
    case addNew
    
    var iconName: String {
        switch self {
            case .sideMenu: return AppIcons.NavigationIcons.menu
            case .back: return AppIcons.NavigationIcons.back
            case .search: return AppIcons.NavigationIcons.search
            case .addNew: return AppIcons.NavigationIcons.add
        }
    }
}

struct NavigationBarView: View {
    let title: String
    let leftNavigationButton: NavigationButtonItem
    let rightNavigationButton: NavigationButtonItem?
    let leftNavigationButtonAction: (() -> Void)?
    let rightNavigationButtonAction: (() -> Void)?
    let screenHeight = UIScreen.main.bounds.size.height * 0.06
    
    var body: some View {
        HStack{
            Button {
                leftNavigationButtonAction?()
            } label: {
                Image(leftNavigationButton.iconName)
            }
            .padding(.leading, 8)
            .frame(height: screenHeight)
            
            Spacer()
            
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .frame(height: screenHeight)
            
            Spacer()
            
            if let rightNavBarButton = rightNavigationButton {
                Button {
                    rightNavigationButtonAction?()
                } label: {
                    Image(rightNavBarButton.iconName)
                }
                .padding(.trailing, 8)
                .frame(height: screenHeight)
            } else {
                Spacer(minLength: 8)
            }

        }
        .frame(width: UIScreen.main.bounds.size.width, height: screenHeight)
        .background(Color.appRed)
    }
}
