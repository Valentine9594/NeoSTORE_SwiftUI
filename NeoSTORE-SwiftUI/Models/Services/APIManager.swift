//
//  APIManager.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 29/07/22.
//

import Foundation
import Combine

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
                case .post:
                    var requestComponents = URLComponents()
                    requestComponents.queryItems = params.map({ (key, value) in
                        URLQueryItem(name: key, value: "\(value)")
                    })
                    request.httpBody = requestComponents.query?.data(using: .utf8)
                case .get:
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
//            200 to 300 is success
            if response.statusCode == 200 {
                completion(.success(data))
            } else {
                completion(.failure(.apiResponseError(responseData: data, statusCode: response.statusCode)))
            }
        }
        task.resume()
    }
    
    func performRequestWithCombine(serviceType: APIService) -> AnyPublisher<Data, APPError> {
        guard let url = URL(string: serviceType.path) else { fatalError("Ccould not get URL request!!!") }
        var request = URLRequest(url: url)
        request.httpMethod = serviceType.method.description
        
        if let params = serviceType.params {
            switch serviceType.method {
                case .post:
                    var requestComponents = URLComponents()
                    requestComponents.queryItems = params.map({ (key, value) in
                        URLQueryItem(name: key, value: "\(value)")
                    })
                    request.httpBody = requestComponents.query?.data(using: .utf8)
                case .get:
                    var requestComponents = URLComponents(string: serviceType.path)
                    requestComponents?.queryItems = params.map({ (key, value) in
                        URLQueryItem(name: key, value: "\(value)")
                    })
                    request.url = requestComponents?.url
            }
        }
        
//        Use inbuilt functions from combine
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap({ (data, response) in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw APPError.somethingWentWrong }
                return data
            })
            .mapError({ error in
                APPError.map(error)
            })
            .eraseToAnyPublisher()
        
    }
}
