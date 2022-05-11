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
                    
//                    NavigationView{
//                        
//                    }
                    
                    VStack{
                        VStack(alignment: .center, spacing: nil, content: {
                            Spacer()
                            
                            Text("NeoSTORE")
                                .font(.custom("", size: 45))
                                .foregroundColor(.white)
                                .bold()
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 49, trailing: 0))
                            
                            VStack(alignment: .center, spacing: 14, content: {
                                TextFieldWithImage(placeholder: "First Name", imageName: "username_icon", text: $firstnameText)
                                
                                TextFieldWithImage(placeholder: "Last Name", imageName: "username_icon", text: $lastnameText)
                                
                                TextFieldWithImage(placeholder: "Email", imageName: "email_icon", text: $emailText)
                                
                                SecureFieldWithImage(placeholder: "Password", imageName: "cpassword_icon", text: $passwordText)
                                
                                SecureFieldWithImage(placeholder: "Confirm Password", imageName: "password_icon", text: $confirmPasswordText)
                                
                                HStack(alignment: .center, spacing: 5, content: {
                                    Text("Gender:")
                                        .bold()
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        genderText = "Male"
                                    }, label: {
                                        Label("Male", image: genderText == "Male" ? "chky" : "chkn")
                                    })
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        genderText = "Female"
                                    }, label: {
                                        Label("Female", image: genderText == "Female" ? "chky" : "chkn")
                                    })
                                })
                                .foregroundColor(.white)
                                .padding(8)
                                
                                TextFieldWithImage(placeholder: "Phone Number", imageName: "cellphone_icon", text: $phoneText)
                      
                            })
                            .padding(EdgeInsets(top: 0, leading: 33, bottom: 16, trailing: 33))
                            
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8, content: {
                                Image(agreetermsAndConditions ? "checked_icon" : "uncheck_icon")
                                
                                Text("I AGREE THE") + Text("TERMS AND CONDITIONS").underline()
                            })
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 33, bottom: 0, trailing: 33))
                            .onTapGesture(perform: {
                                agreetermsAndConditions.toggle()
                            })

                            ButtonWithForegroundAndBackgroundColorWithText(buttonTitle: "REGISTER", buttonForegroundColor: .red, buttonBackgroundColor: .white){
                                debugPrint("Clicked REGISTER!!!")
                            }
                                                        
                            Spacer()

                        })
                        
                    }
                    .frame(width: geometry.size.width, height: 800)
                    
                }
                .frame(maxWidth: UIScreen.main.bounds.size.width, maxHeight: 800)
            })
            
        }
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



