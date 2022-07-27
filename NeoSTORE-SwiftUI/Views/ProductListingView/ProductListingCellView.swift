//
//  ProductListingCellView.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 26/07/22.
//

import SwiftUI

struct ProductListCellView: View {
    var item: ProductModel
    private let productImageSide = UIScreen.main.bounds.width / 4
    
    var body: some View {
        VStack {
            HStack {
                Image(AppIcons.ProductCategoryIcons.cupboard)
                    .resizable()
                    .frame(width: productImageSide, height: productImageSide, alignment: .center)
                
                VStack(alignment: .leading) {
                    Text(item.name ?? "")
                    Spacer()
                    Text(item.category ?? "")
                    Spacer()
                    HStack {
                        Text(item.description ?? "")
                        Spacer()
                        HStack(spacing: 0) {
                            Image(AppIcons.RatingIcons.starUnrated)
                                .resizable()
                            Image(AppIcons.RatingIcons.starUnrated)
                                .resizable()
                            Image(AppIcons.RatingIcons.starUnrated)
                                .resizable()
                            Image(AppIcons.RatingIcons.starUnrated)
                                .resizable()
                            Image(AppIcons.RatingIcons.starUnrated)
                                .resizable()
                        }
                        .frame(width: 100, height: 20)
                    }
                }
            }
        }
    }
}
