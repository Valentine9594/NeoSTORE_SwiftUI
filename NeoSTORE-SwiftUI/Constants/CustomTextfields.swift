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
                .foregroundColor(.white)
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
                .foregroundColor(.white)
                .frame(width: 54 ,height: 54, alignment: .center)
                .scaledToFill()
                
            
            TextField("Enter Username", text: $text)
                .foregroundColor(.white)
                .background(Color.red)
                .frame(height: 54, alignment: .center)
        })
        .border(Color.white, width: 2)
    }
}
