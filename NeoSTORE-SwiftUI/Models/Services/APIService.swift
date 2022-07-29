//
//  APIService.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 28/07/22.
//

import Foundation
import SwiftUI

enum HTTPMethod {
    case get
    case post
    
    var description: String {
        switch self {
            case .get:
                return "GET"
            case .post:
                return "POST"
        }
    }
}

enum APIService {
    typealias AnyDict = [String: Any]
    typealias StringDict = [String: String]
    
//MARK: User related APIs
    case login(params: AnyDict)
    case register(params: AnyDict)
    case forgotPassword
    case changePassword
    case updateAccount
    case fetchAccount
    
//MARK: Product related APIs
    case getProductList
    case getProductDetails
    case setProductRatings
    
//MARK: Cart related APIs
    case addToCart
    case editCart
    case deleteCart
    case getListCartItems
    
//MARK: Order related APIs
    case getOrder
    case getOrderList
    case getOrderDetail
    
    private struct APILink {
        static let baseURL = "http://staging.php-dev.in:8844/trainingapp/api"
        static let contentValue = "application/x-www-form-urlencoded"
        static let contentKey = "Content-Type"
        static let accessToken = "access_token"
        static var accessTokenValue: String {
//            Need to get access token from device storage
            let optionalString: String? = ""
            return optionalString ?? "NO_ACCESS_TOKEN"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .fetchAccount, .getProductList, .getProductDetails, .getListCartItems, .getOrderList, .getOrderDetail:
                return .get
            default:
                return .post
        }
    }
    
    var params: AnyDict? {
        switch self {
            case .login(let params):
                return params
            default:
                return nil
        }
    }
    
    var header: AnyDict? {
        var headerDict = AnyDict()
        switch self {
            case .changePassword, .updateAccount, .addToCart, .getListCartItems, .editCart, .deleteCart, .getOrderList, .getOrderDetail, .getOrder:
            headerDict = [APILink.contentKey: APILink.contentValue, APILink.accessToken: APILink.accessTokenValue]
            default:
                break
        }
        return headerDict
    }
    
    var path: String {
        var urlPath = APILink.baseURL
        switch self {
            case .login:
                urlPath += "/users/login"
            case .register:
                urlPath += "/users/register"
            default:
                urlPath += ""
        }
        return urlPath
    }
}
