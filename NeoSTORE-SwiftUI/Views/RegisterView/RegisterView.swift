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
    @State private var phoneText: String = ""
    @State private var genderText: String = "Male"
    @State private var agreetermsAndConditions: Bool = false
    
    var body: some View {
        ZStack(alignment: .center){
            Color.appRed
            
            GeometryReader(content: { geometry in
                ScrollView(.vertical, showsIndicators: false){
//                    VStack{
//
                        LazyVStack(alignment: .center, spacing: nil, content: {
                            Spacer()
                            
                            AppTitleView()
                            
                            VStack(alignment: .center, spacing: 14, content: {
                                TextFieldWithImage(placeholder: "First Name", imageName: AppIcons.UserProfileIcons.username, text: $firstnameText)
                                
                                TextFieldWithImage(placeholder: "Last Name", imageName: AppIcons.UserProfileIcons.username, text: $lastnameText)
                                
                                TextFieldWithImage(placeholder: "Email", imageName: AppIcons.UserProfileIcons.email, text: $emailText)
                                
                                SecureFieldWithImage(placeholder: "Password", imageName: AppIcons.UserProfileIcons.passwordUnlocked, text: $passwordText)
                                
                                SecureFieldWithImage(placeholder: "Confirm Password", imageName: AppIcons.UserProfileIcons.passwordLocked, text: $confirmPasswordText)
                                
                                HStack(alignment: .center, spacing: 5, content: {
                                    Text("Gender:")
                                        .bold()
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        genderText = "Male"
                                    }, label: {
                                        Label("Male", image: genderText == "Male" ? AppIcons.UserProfileIcons.checkYes : AppIcons.UserProfileIcons.checkNo)
                                    })
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        genderText = "Female"
                                    }, label: {
                                        Label("Female", image: genderText == "Female" ? AppIcons.UserProfileIcons.checkYes : AppIcons.UserProfileIcons.checkNo)
                                    })
                                })
                                .foregroundColor(.white)
                                .padding(8)
                                
                                TextFieldWithImage(placeholder: "Phone Number", imageName: AppIcons.UserProfileIcons.phone, text: $phoneText)
                      
                            })
                            .padding(EdgeInsets(top: 0, leading: 33, bottom: 16, trailing: 33))
                            
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8, content: {
                                Image(agreetermsAndConditions ? AppIcons.UserProfileIcons.checked : AppIcons.UserProfileIcons.unchecked)
                                
                                Text("I AGREE ") + Text("THE TERMS AND CONDITIONS").underline()
                            })
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 33, bottom: 0, trailing: 33))
                            .onTapGesture(perform: {
                                agreetermsAndConditions.toggle()
                            })

                            ButtonWithForegroundAndBackgroundColorWithText(buttonTitle: "REGISTER", buttonForegroundColor: .red, buttonBackgroundColor: .white){
                                debugPrint("Clicked REGISTER!!!")
                            }
                            .padding(EdgeInsets(top: 0, leading: 33, bottom: 0, trailing: 33))
                                                        
                            Spacer()

                        })
                        
//                    }
//                    .frame(width: geometry.size.width, height: 800)
                    
                }
                .frame(maxWidth: UIScreen.main.bounds.size.width, maxHeight: 800)
            })
            
        }
        .navigationTitle(Text("Register"))
        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarBackButtonHidden(true)
        .clipped()
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environment(\.sizeCategory, .extraExtraLarge)
            .previewLayout(.fixed(width: 396.0, height: /*@START_MENU_TOKEN@*/800.0/*@END_MENU_TOKEN@*/))
            
    }
}
