//
//  NavigationView.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 25/07/22.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        HStack{
            Button {
                debugPrint("Clicked Button")
            } label: {
                Image("menu_icon")
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
                debugPrint("Clicked Button")
            } label: {
                Image("search_icon")
            }
            .padding(.trailing, 8)
            .frame(height: UIScreen.main.bounds.height*0.08)
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.height*0.08)
        .background(Color.appRed)
    }
}
