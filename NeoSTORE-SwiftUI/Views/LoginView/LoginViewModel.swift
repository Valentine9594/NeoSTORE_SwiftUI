//
//  LoginViewModel.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 29/07/22.
//

import SwiftUI

//protocol LoginViewModelType {
//    func login(email: String, password: String)
//    var didLogin: Bool {get set}
//    var loggedIn: Published<Bool> {get set}
//}

//final class LoginViewModel: LoginViewModelType {
final class LoginViewModel: ObservableObject {
    @Published var didLogin: Bool = false
    
    func login(email: String, password: String) {
        let params = ["email": email, "password": password]
        APIManager.shared.performRequest(serviceType: .login(params: params)) { result in
            switch result {
                case .success(let data):
                    let dataString = String(data: data, encoding: .utf8)
                    self.didLogin = true
                    debugPrint("API Response: \(String(describing: dataString))")
                case .failure(let error):
                    let jsonDecoded: APIFailureResponse? = JSONParser.shared.decode(data: error.errorData)
                    let errorMessage = jsonDecoded?.message ?? error.description
                    self.didLogin = false
                    debugPrint("Error: \(errorMessage)")
            }
        }
    }
    
    
}
