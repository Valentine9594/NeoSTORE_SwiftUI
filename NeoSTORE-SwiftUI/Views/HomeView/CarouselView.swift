//
//  CarouselView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 17/05/22.
//

import SwiftUI

struct CarouselView: View {
    let carouselImages: [String]
    @Binding var currentPage: Int
    
    var body: some View {
        
        TabView(selection: $currentPage){
            ForEach(0..<carouselImages.count, id: \.self) {
                Image(carouselImages[$0])
                    .resizable()
                    .aspectRatio(3/2, contentMode: .fill)
                    .clipped()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}
