//
//  LoginView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            Text("NeoSTORE")
                .font(.largeTitle)
                .foregroundColor(.green)
                .bold()
                .padding(.bottom, 49)
//                .background(Color.red, alignment: .init(horizontal: .center, vertical: .top))
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

