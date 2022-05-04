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
                        .padding(EdgeInsets(top: 150, leading: 0, bottom: 49, trailing: 0))
                    
                    VStack(spacing: 16, content: {
                        TextFieldWithImage(imageName: "username_icon", text: $usernameTextfield)
                        
                        SecureFieldWithImage(imageName: "password_icon", text: $passwordTextfield)
              
                    })
                    .padding(EdgeInsets(top: 0, leading: 33, bottom: 0, trailing: 33))

                    ButtonWithForegroundAndBackgroundColorWithText(buttonTitle: "LOGIN", buttonForegroundColor: .red, buttonBackgroundColor: .white){
                        debugPrint("Clicked Login!!!")
                    }
                    
                    Text("Forgot Password?")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 33)
                        .font(.title3)
                        .onTapGesture {
                            debugPrint("Tapped Forgot Password!!")
                        }
                    
                    Spacer()
                    
                    HStack(alignment: .bottom, spacing: 8, content: {
                        Text("DON'T HAVE AN ACCOUNT?")
                            .font(.title3)
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: .none, height: .none, alignment: .topLeading)
                        
                        Image("plus")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .foregroundColor(.white)
                            .frame(width: 46, height: 46, alignment: .center)
                            .onTapGesture {
                                debugPrint("Tapped Plus Icon!!")
                            }
                            .frame(width: .none, height: .none, alignment: .trailing)
                    })
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(EdgeInsets(top: 33, leading: 0, bottom: 0, trailing: 0))
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            })
            
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


