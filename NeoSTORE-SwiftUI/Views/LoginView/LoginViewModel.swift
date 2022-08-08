//
//  LoginViewModel.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 29/07/22.
//

import SwiftUI
import Combine

//protocol LoginViewModelType {
//    func login(email: String, password: String)
//    var didLogin: Bool {get set}
//    var loggedIn: Published<Bool> {get set}
//}

//final class LoginViewModel: LoginViewModelType {
final class LoginViewModel: ObservableObject {
    @Published var didLogin: Bool = false
    var subscriptions = Set<AnyCancellable>()
    
    func login(email: String, password: String) {
        let params = ["email": email, "password": password]
        APIManager.shared.performRequestWithCombine(serviceType: .login(params: params))
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { data in
                print(String(data: data, encoding: .utf8) ?? "No Data")
            }
            .store(in: &subscriptions)

    }
    
    
}
