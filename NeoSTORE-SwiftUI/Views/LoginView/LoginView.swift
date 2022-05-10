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
        ZStack(alignment: .bottom){
            Color.appRed
            
            GeometryReader(content: { geometry in
                ScrollView(.vertical, showsIndicators: false){
                    
                    VStack{
                        VStack(alignment: .center, spacing: nil, content: {
                            Spacer()
                            
                            Text("NeoSTORE")
                                .font(.custom("", size: 45))
                                .foregroundColor(.white)
                                .bold()
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 49, trailing: 0))
                            
                            VStack(alignment: .center, spacing: 16, content: {
                                TextFieldWithImage(placeholder: "Username", imageName: "username_icon", text: $usernameTextfield)
                                
                                SecureFieldWithImage(placeholder: "Password", imageName: "password_icon", text: $passwordTextfield)
                      
                            })
                            .padding(EdgeInsets(top: 0, leading: 33, bottom: 0, trailing: 33))

                            ButtonWithForegroundAndBackgroundColorWithText(buttonTitle: "LOGIN", buttonForegroundColor: .red, buttonBackgroundColor: .white){
                                debugPrint("Clicked Login!!!")
                            }
                            
                            Text("Forgot Password?")
                                .bold()
                                .foregroundColor(.white)
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .onTapGesture {
                                    debugPrint("Tapped Forgot Password!!")
                                }
                            
                            Spacer()
                            
                            HStack(alignment: .center, spacing: 33, content: {
                                Text("DON'T HAVE AN ACCOUNT?")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .bold()
                                    .frame(width: .none, height: .none, alignment: .leading)
                                
                                Image("plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .foregroundColor(.white)
                                    .background(Color.appMaroon)
                                    .frame(width: 46, height: 46, alignment: .trailing)
                                    .onTapGesture {
                                        debugPrint("Tapped Plus Icon!!")
                                    }

                            })
                            .frame(width: geometry.size.width, height: 50)
                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                        })
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    
                }
                .frame(maxWidth: UIScreen.main.bounds.size.width, maxHeight: UIScreen.main.bounds.size.height)
            })
            
        }
        .clipped()
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


