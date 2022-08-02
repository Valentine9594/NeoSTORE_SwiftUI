//
//  Models.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import SwiftUI

struct CarouselImages{
    let name, imageName: String?
    var image: Image{
        Image(imageName ?? "")
    }
}

struct APIFailureResponse: Decodable {
    let status: Int?
    let message, userMessage: String?
    
    enum codingKeys: String, CodingKey {
        case status
        case message
        case userMessage = "user_msg"
    }
}
