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
