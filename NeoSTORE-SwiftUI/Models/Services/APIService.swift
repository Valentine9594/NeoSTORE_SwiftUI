//
//  APIService.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 28/07/22.
//

import Foundation

enum APIService {
    typealias AnyDict = [String: Any]
    
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
    
    var method: String {
        switch self {
            case .fetchAccount, .getProductList, .getProductDetails, .getListCartItems, .getOrderList, .getOrderDetail:
                return "GET"
            default:
                return "POST"
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
        switch self {
            default:
                return nil
        }
    }
    
    var baseURL: String {
        return "http://staging.php-dev.in:8844/trainingapp/api"
    }
    
    var urlPath: String {
        var remainingURLPath = ""
        switch self {
            case .login:
                remainingURLPath = "/users/login"
        case .register:
                remainingURLPath = "users/register"
            default:
                remainingURLPath = ""
        }
        return baseURL + remainingURLPath
    }
}
