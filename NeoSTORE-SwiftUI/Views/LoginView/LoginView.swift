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
            Color.red.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 0){
                    Text("NeoSTORE")
                        .font(.custom("", size: 45))
                        .foregroundColor(.white)
                        .bold()
                        .padding(EdgeInsets(top: 150, leading: 0, bottom: 49, trailing: 0))
                    
                    VStack(spacing: 16, content: {
                        TextFieldWithImage(imageName: "username_icon", text: $usernameTextfield)
                        
                        SecureFieldWithImage(imageName: "password_icon", text: $passwordTextfield)
              
                    })
                    .padding(EdgeInsets(top: 0, leading: 33, bottom: 0, trailing: 33))

                    Button(action: {
                        debugPrint("Login Button Clicked!!")
                    }, label: {
                        Text("LOGIN")
                            .font(.custom("", size: 22))
                            .bold()
                            .padding(5)
                    })
                    .foregroundColor(.red)
                    .background(Color.white)
                    .padding(EdgeInsets(top: 33, leading: 0, bottom: 21, trailing: 0))
                    
                    Text("Forgot Password?")
                        .font(.title3)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom, 33)
                        .onTapGesture {
                            debugPrint("Tapped Forgot Password!!")
                        }
                    
                    Spacer()
                    
                    HStack(spacing: 8, content: {
                        Text("DON'T HAVE AN ACCOUNT?")
                            .font(.title3)
                            .foregroundColor(.white)
                            .bold()
                        Image("plus")
                            .clipped()
                            .foregroundColor(.white)
                            .frame(width: 46, height: 46, alignment: .center)
                            .scaledToFill()
                            .onTapGesture {
                                debugPrint("Tapped Plus Icon!!")
                            }
                    })
                    .padding(EdgeInsets(top: 33, leading: 0, bottom: 0, trailing: 0))
                    
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

