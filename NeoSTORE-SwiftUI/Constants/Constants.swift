//
//  Constants.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 17/05/22.
//

import Foundation
import CoreData

enum ProductCategories: Int, CaseIterable{
    case table = 1
    case sofa = 2
    case cupboard = 3
    case chair = 4
    
    var description: String{
        switch self{
            case .table:
                return "table"
            case .chair:
                return "chairs"
            case .sofa:
                return "sofa"
            case .cupboard:
                return "cupboard"
        }
    }
    
    var imageName: String{
        description + "icon"
    }
}
