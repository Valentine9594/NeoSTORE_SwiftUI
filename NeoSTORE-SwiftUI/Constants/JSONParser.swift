//
//  JSONParser.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 29/07/22.
//

import Foundation
import UIKit

class JSONParser {
    
    static let shared = JSONParser()
    
    private init() { }
    
    static func decode<T: Decodable>(data: Data) -> T? {
        let jsonDecoder = JSONDecoder()
        let jsonValue = try? jsonDecoder.decode(T.self, from: data)
        return jsonValue
    }
}
