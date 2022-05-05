//
//  Constants.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import SwiftUI

struct SecureFieldWithImage: View {
    var placeholder: String
    var imageName: String = "person.fill"
    @Binding var text: String

    var body: some View {
        HStack(spacing: 5, content: {
            Image(imageName)
                .frame(width: 54 ,height: 54, alignment: .center)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.white)
            
            SecureField("", text: $text)
                .modifier(PlaceHolderStyle(showPlaceholder: text.isEmpty || text == "", placeholder: placeholder))
        })
        .border(Color.white, width: 2)
    }
}

struct TextFieldWithImage: View {
    var placeholder: String
    var imageName: String = "person.fill"
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 5, content: {
            Image(imageName)
                .foregroundColor(.white)
                .frame(width: 54 ,height: 54, alignment: .center)
                .aspectRatio(contentMode: .fill)
            
            TextField("", text: $text)
                .modifier(PlaceHolderStyle(showPlaceholder: text.isEmpty || text == "", placeholder: placeholder))
        })
        .border(Color.white, width: 2)
    }
}

public struct PlaceHolderStyle: ViewModifier{
    var showPlaceholder: Bool
    var placeholder: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading, content: {
            if showPlaceholder{
                Text(placeholder)
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                    .zIndex(2)
            }
            content
                .frame(height: 54, alignment: .center)
                .foregroundColor(.white)
                .background(Color.appRed)
                .font(.headline)
                .zIndex(1)
        })
        .onAppear(perform: {
            debugPrint(showPlaceholder)
        })
    }
}
