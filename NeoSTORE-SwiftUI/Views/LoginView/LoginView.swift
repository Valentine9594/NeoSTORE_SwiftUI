//
//  LoginView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import Combine
import SwiftUI

struct LoginView: View {
    @State private var usernameTextfield: String = ""
    @State private var passwordTextfield: String = ""
    @State private var toNavigateRegister: Bool = false
    @State private var keyboardHeight: CGFloat = 0
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .center){
                Color.appRed
                
//                GeometryReader(content: { geometry in
                    ScrollView(.vertical, showsIndicators: false){
                        
                        VStack {
                            VStack(alignment: .center, spacing: nil, content: {
                                NavigationLink(
                                    "", destination: RegisterView(),
                                    isActive: $toNavigateRegister)
                                    .navigationBarHidden(true)
                                
                                NavigationLink(
                                    "", destination: HomeView(), isActive: $loginViewModel.didLogin)
                                    .navigationBarHidden(true)
                                
                                Spacer()
//                                    .frame( minHeight: 50, maxHeight: 150)
                                
                                AppTitleView()
                                
                                VStack(alignment: .center, spacing: 16, content: {
//                                    username = "rogers@gmail.com"
//                                    password = "rogers@1234"
                                    
                                    TextFieldWithImage(placeholder: "Username", imageName: AppIcons.UserProfileIcons.username, text: $usernameTextfield)
                                    
                                    SecureFieldWithImage(placeholder: "Password", imageName: AppIcons.UserProfileIcons.passwordLocked, text: $passwordTextfield)
                                    
                                    ButtonWithForegroundAndBackgroundColorWithText(buttonTitle: "LOGIN", buttonForegroundColor: .red, buttonBackgroundColor: .white){
                                        
                                        debugPrint("Clicked Login!!!")
                                        loginViewModel.login(email: usernameTextfield, password: passwordTextfield)
                                    }
                                    .padding(.top, 16)
                          
                                })
                                .padding(EdgeInsets(top: 0, leading: 33, bottom: 0, trailing: 33))
                                
                                Text("Forgot Password?")
                                    .bold()
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .multilineTextAlignment(.center)
                                    .onTapGesture {
                                        debugPrint("Tapped Forgot Password!!")
                                    }
                                
                                Spacer()
//                                    .frame( minHeight: 50, maxHeight: 150)
                                
                                LazyHStack(alignment: .center, spacing: 33, content: {
                                    Text("DON'T HAVE AN ACCOUNT?")
                                        .font(.title3)
                                        .foregroundColor(.white)
                                        .bold()
                                        .frame(width: .none, height: .none, alignment: .leading)
                                    
                                    Image(AppIcons.NavigationIcons.add)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                        .foregroundColor(.white)
                                        .background(Color.appMaroon)
                                        .frame(width: 46, height: 46, alignment: .trailing)
                                        .onTapGesture {
                                            debugPrint("Tapped Plus Icon!!")
                                            toNavigateRegister = true
                                        }

                                })
                                .frame(width: UIScreen.main.bounds.size.width, height: 50)
                                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                            })
//                            frame
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.9)
//                        -geometry.safeAreaInsets.bottom
                    }
                    .frame(width: UIScreen.main.bounds.width, height: .none)
//                })
                
            }
//            .keyboardAdaptive()
            .clipped()
//            .onTapGesture {
//                UIApplication.shared.endEditing()
//            }

        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


