//
//  Constants.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import SwiftUI

struct SecureFieldWithImage: View {
    var placeholder: Text
    var imageName: String = "person.fill"
    @Binding var text: String
    var onCommit: ()->() = { }

    var body: some View {
        HStack(spacing: 5, content: {
            Image(imageName)
                .frame(width: 54 ,height: 54, alignment: .center)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.white)
            
            if text.isEmpty { placeholder
                .foregroundColor(.white)
            }
            SecureField("", text: $text, onCommit: onCommit)
                .frame(height: 54, alignment: .center)
                .background(Color.appRed)
                .foregroundColor(.white)
                .font(.headline)
        })
        .border(Color.white, width: 2)
    }
}

struct TextFieldWithImage: View {
    var placeholder: Text
    var imageName: String = "person.fill"
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var onCommit: ()->() = { }
    
    var body: some View {
        HStack(spacing: 5, content: {
            Image(imageName)
                .foregroundColor(.white)
                .frame(width: 54 ,height: 54, alignment: .center)
                .aspectRatio(contentMode: .fill)
            
            if text.isEmpty { placeholder
                .foregroundColor(.white)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: onCommit)
                .frame(height: 54, alignment: .center)
                .foregroundColor(.white)
                .background(Color.appRed)
                .font(.headline)
        })
        .border(Color.white, width: 2)
    }
}
