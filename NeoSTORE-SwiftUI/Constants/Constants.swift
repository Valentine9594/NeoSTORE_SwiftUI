//
//  Constants.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import SwiftUI

struct SecureFieldWithImage: View {
    var imageName: String = "person.fill"
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 5, content: {
            Image(imageName)
                .frame(width: 54 ,height: 54, alignment: .center)
                .scaledToFill()
                .foregroundColor(.white)
            
            SecureField("Enter Password", text: $text)
                .background(Color.red)
                .frame(height: 54, alignment: .center)
        })
        .border(Color.white, width: 2)
    }
}

struct TextFieldWithImage: View {
    var imageName: String = "person.fill"
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 5, content: {
            Image(imageName)
                .frame(width: 54 ,height: 54, alignment: .center)
                .scaledToFill()
                .foregroundColor(.white)
            
            TextField("Enter Username", text: $text)
                .background(Color.red)
                .frame(height: 54, alignment: .center)
        })
        .border(Color.white, width: 2)
    }
}
