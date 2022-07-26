//
//  ProductListingCellView.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 26/07/22.
//

import SwiftUI

struct ProductListCellView: View {
    var item: ProductModel
    
    var body: some View {
        HStack {
            Image("chairsicon")
                .resizable()
                .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(item.name ?? "")
                Spacer()
                Text(item.category ?? "")
                Spacer()
                HStack {
                    Text(item.description ?? "")
                    Spacer()
                    HStack(spacing: 0) {
                        Image("star_uncheck")
                            .resizable()
                        Image("star_uncheck")
                            .resizable()
                        Image("star_uncheck")
                            .resizable()
                        Image("star_uncheck")
                            .resizable()
                        Image("star_uncheck")
                            .resizable()
                    }
                    .frame(width: 100, height: 20)
                }
            }
        }
        .padding(5)
    }
}
