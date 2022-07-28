//
//  HomeView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 12/05/22.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentation
    @State private var currentPage: Int = 0
    @State private var toNavigateProductListing: Bool = false
    @State private var productCategory: ProductCategories = .table
    private let carouselImages = ["slider_img1", "slider_img2", "slider_img3", "slider_img4"]
    private let homeViewGrid = [GridItem(.flexible(minimum: (UIScreen.main.bounds.width/2)-33), spacing: 12), GridItem(.flexible(minimum: (UIScreen.main.bounds.width/2)-33), spacing: 12)]
    
    var body: some View {
        VStack(spacing: 0){
            NavigationBarView(title: "NeoSTORE", leftNavigationButton: .sideMenu, rightNavigationButton: .search, leftNavigationButtonAction: {
                debugPrint("clicked home")
                self.presentation.wrappedValue.dismiss()
            }, rightNavigationButtonAction: {
                debugPrint("clicked home")
            })
            
            CarouselView(carouselImages: carouselImages, currentPage: $currentPage)
                .padding(.bottom, 15)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.35)
            
            LazyHGrid(rows: homeViewGrid, spacing: 12) {
                ForEach((1...ProductCategories.allCases.count), id: \.self) { index in
                    Image(ProductCategories(rawValue: index)?.imageName ?? "chairsicon")
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .onTapGesture {
                            productCategory = ProductCategories(rawValue: index) ?? .table
                            toNavigateProductListing = true
                        }
                }
            }
            .frame(height: .none)
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            
            Spacer()
            
            NavigationLink(
                "", destination: ProductListingView(productCategory: productCategory),
                isActive: $toNavigateProductListing)
                .navigationBarHidden(true)
        }
        .frame(width: UIScreen.main.bounds.width, height: .none)
        .navigationBarHidden(true)
    }
}
    


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
