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
    
    init(carouselImages: [String], currentPage: Binding<Int>){
        self.carouselImages = carouselImages
        self._currentPage = currentPage
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.appRed)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(.gray)
        UIPageControl().subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
    }
    
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
