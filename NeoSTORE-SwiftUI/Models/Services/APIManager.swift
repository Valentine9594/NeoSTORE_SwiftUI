//
//  APIManager.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 29/07/22.
//

import Foundation

public class APIManager {
    typealias APIResponse = ((Result<Data, APPError>) -> Void)
    static let shared = APIManager()
    
    private init() { }
    
    func performRequest(serviceType: APIService, completion: @escaping(APIResponse)) {
        guard let url = URL(string: serviceType.path) else { return }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = serviceType.method.description
        
        if let params = serviceType.params {
            switch serviceType.method {
                case .get:
                    var requestComponents = URLComponents()
                    requestComponents.queryItems = params.map({ (key, value) in
                        URLQueryItem(name: key, value: "\(value)")
                    })
                    request.httpBody = requestComponents.query?.data(using: .utf8)
                case .post:
                    var requestComponents = URLComponents(string: serviceType.path)
                    requestComponents?.queryItems = params.map({ (key, value) in
                        URLQueryItem(name: key, value: "\(value)")
                    })
                    request.url = requestComponents?.url
            }
        }
        
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.somethingWentWrong))
                return
            }
            
            guard let data = data else {
                completion(.failure(.somethingWentWrong))
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                completion(.success(data))
            } else {
                completion(.failure(.apiResponseError(responseData: data, statusCode: response.statusCode)))
            }
        }
        task.resume()
    }
}
