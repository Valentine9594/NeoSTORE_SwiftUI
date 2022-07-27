//
//  Constants.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 17/05/22.
//

import Foundation

enum ProductCategories: Int, CaseIterable {
    case table = 1
    case sofa = 2
    case cupboard = 3
    case chair = 4
    
    var description: String {
        switch self {
            case .table:
                return "Tables"
            case .chair:
                return "Chairs"
            case .sofa:
                return "Sofas"
            case .cupboard:
                return "Cupboards"
        }
    }
    
    var id: Int {
        switch self {
            case .table:
                return 1
            case .sofa:
                return 2
            case .cupboard:
                return 3
            case .chair:
                return 4
        }
    }
    
    var imageName: String {
        switch self {
            case .table:
                return AppIcons.ProductCategoryIcons.table
            case .chair:
                return AppIcons.ProductCategoryIcons.chair
            case .sofa:
                return AppIcons.ProductCategoryIcons.sofa
            case .cupboard:
                return AppIcons.ProductCategoryIcons.cupboard
        }
    }
}
