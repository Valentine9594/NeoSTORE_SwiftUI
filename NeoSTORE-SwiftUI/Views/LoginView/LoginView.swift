//
//  LoginView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import SwiftUI

struct LoginView: View {
    @State private var usernameTextfield: String = ""
    @State private var passwordTextfield: String = ""
    
    var body: some View {
        ZStack(alignment: .center){
            Color.red
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 0){
                    Text("NeoSTORE")
                        .font(.custom("", size: 45))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom, 49)
                        .padding(.top, 150)
                    
                    VStack(spacing: 16, content: {
                        TextFieldWithImage(imageName: "username_icon", text: $usernameTextfield)
                        
                        SecureFieldWithImage(imageName: "password_icon", text: $passwordTextfield)
              
                    })
                    .padding(.leading, 33)
                    .padding(.trailing, 33)

                    Button("LOGIN") {
                        debugPrint("Login Button Clicked!!")
                    }
                    .frame(minHeight: 26, maxHeight: 26, alignment: .top)
                    .padding(.top, 33)
                    .padding(.leading, 33)
                    .padding(.trailing, 33)
                    
                    Text("Forgot Password?")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom, 33)
                    
                    HStack(spacing: 0, content: {
                        Text("Placeholder")
                        Text("New")
                    })
                    .frame(alignment: .bottomLeading)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            })
            
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


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
