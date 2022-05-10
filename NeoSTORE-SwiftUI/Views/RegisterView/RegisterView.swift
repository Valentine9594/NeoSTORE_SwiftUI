//
//  RegisterView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 10/05/22.
//

import SwiftUI

struct RegisterView: View {
    @State private var firstnameText: String = ""
    @State private var lastnameText: String = ""
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var confirmPasswordText: String = ""
    
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
                                TextFieldWithImage(placeholder: "First Name", imageName: "username_icon", text: $firstnameText)
                                
                                TextFieldWithImage(placeholder: "Last Name", imageName: "username_icon", text: $lastnameText)
                                
                                TextFieldWithImage(placeholder: "Email", imageName: "email_icon", text: $emailText)
                                
                                SecureFieldWithImage(placeholder: "Password", imageName: "cpassword_icon", text: $passwordText)
                                
                                SecureFieldWithImage(placeholder: "Confirm Password", imageName: "password_icon", text: $confirmPasswordText)
                      
                            })
                            .padding(EdgeInsets(top: 0, leading: 33, bottom: 16, trailing: 33))
                            
                            Text("Forgot Password?")
                                .bold()
                                .foregroundColor(.white)
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .onTapGesture {
                                    debugPrint("Tapped Forgot Password!!")
                                }


                            ButtonWithForegroundAndBackgroundColorWithText(buttonTitle: "REGISTER", buttonForegroundColor: .red, buttonBackgroundColor: .white){
                                debugPrint("Clicked REGISTER!!!")
                            }
                                                        
                            Spacer()

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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}



