//
//  AppError.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 29/07/22.
//

import Foundation

enum APPError: Error {
    case somethingWentWrong
    case apiResponseError(error: Error)
    
    var description: String {
        switch self {
            case .somethingWentWrong:
                return "Something Went Wrong!"
            case .apiResponseError(let error):
                return error.localizedDescription
        }
    }
}
