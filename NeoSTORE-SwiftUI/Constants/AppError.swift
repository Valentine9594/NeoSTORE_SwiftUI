//
//  AppError.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 29/07/22.
//

import Foundation

enum APPError: Error {
    case somethingWentWrong
    case apiResponseError(responseData: Data?, statusCode: Int)
    
    var description: String {
        switch self {
            case .somethingWentWrong:
                return "Something Went Wrong!"
            case .apiResponseError(_, let statusCode):
                return "Failed with Status Code - \(statusCode)"
        }
    }
    
    var errorData: Data? {
        switch self {
            case .apiResponseError(let responseData, _):
                return responseData
            default:
                return nil
        }
    }
    
    static func map(_ error: Error) -> APPError {
      return (error as? APPError) ?? .somethingWentWrong
    }
}
