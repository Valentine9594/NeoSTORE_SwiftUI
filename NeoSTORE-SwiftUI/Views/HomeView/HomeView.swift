//
//  HomeView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 12/05/22.
//

import SwiftUI

struct HomeView: View {
    @State private var currentPage: Int = 0
    private let carouselImages = ["slider_img1", "slider_img2", "slider_img3", "slider_img4"]
    
    var body: some View {
       
        VStack(alignment: .center, spacing: 10){
            CarouselView(carouselImages: carouselImages, currentPage: $currentPage)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.35)
            
            LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach((0..<ProductCategories.allCases.count), id: \.self) { index in
                    Image(ProductCategories(rawValue: index+1)?.imageName ?? "chairsicon")
                        .resizable()
                        .onTapGesture {
                            debugPrint("Clicked: \(ProductCategories(rawValue: index + 1)?.description ?? "Nothing")")
                        }
                }
            }
        }
    }
}
    


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
