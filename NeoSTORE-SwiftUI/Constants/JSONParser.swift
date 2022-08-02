//
//  JSONParser.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 29/07/22.
//

import Foundation

class JSONParser {
    
    static let shared = JSONParser()
    
    private init() { }
    
    func decode<T: Decodable>(data: Data?) -> T? {
        let jsonDecoder = JSONDecoder()
        if let data = data {
            return try? jsonDecoder.decode(T.self, from: data)
        }
        return nil
    }
    
    func processResponse<T: Decodable>(result: Data?, type: T.Type) -> T?{
        if let response = result{
            do {
                return try type.decode(data: response)
            } catch {}
        }
        return nil
    }
}

extension Decodable{
    static func decode(data: Data) throws -> Self{
        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .formatted(.dateFormatter)
        return try decoder.decode(Self.self, from: data)
    }
}
