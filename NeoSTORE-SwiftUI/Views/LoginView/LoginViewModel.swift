//
//  LoginViewModel.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 29/07/22.
//

import Foundation

protocol LoginViewModelType {
    func login(email: String, password: String) -> Bool
}

class LoginViewModel: LoginViewModelType {
    func login(email: String, password: String) -> Bool {
        var loginTime = false
        let params = ["email": email, "password": password]
        APIManager.shared.performRequest(serviceType: .login(params: params)) { result in
            switch result {
                case .success(let data):
                    let dataString = String(data: data, encoding: .utf8)
                    debugPrint("API Response: \(String(describing: dataString))")
                    loginTime = true
                case .failure(let error):
                    guard let errorData = error.errorData else { return }
                    let jsonDecoded: APIFailureResponse? = JSONParser.decode(data: errorData)
                    debugPrint("Error: \(jsonDecoded?.userMessage ?? "")")
            }
        }
        return loginTime
    }
    
    
}
