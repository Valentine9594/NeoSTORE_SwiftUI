//
//  Models.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import Foundation
import SwiftUI

struct CarouselImages{
    let name: String?
    let imageName: String?
    var image: Image{
        Image(imageName ?? "")
    }
}

struct APIFailureResponse {
    let status: Int?
    let data: Data?
    let message: String?
    let userMessage: String?
    
    enum codingKeys: String, CodingKey {
        case status
        case data
        case message
        case userMessage = "user_msg"
    }
}

extension APIFailureResponse: Decodable {
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: codingKeys.self)
        status = try value.decodeIfPresent(Int.self, forKey: .status)
        data = try value.decodeIfPresent(Data.self, forKey: .data)
        message = try value.decodeIfPresent(String.self, forKey: .message)
        userMessage = try value.decodeIfPresent(String.self, forKey: .userMessage)
    }
}
