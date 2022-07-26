//
//  ProductListingView.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 25/07/22.
//

import SwiftUI

struct ProductListingView: View {
    @State var count: Int = 0
    let items = [ProductModel(id: "1", name: "1", category: "chairs", description: "New chair"), ProductModel(id: "2", name: "2", category: "chairs", description: "New chair"), ProductModel(id: "3", name: "3", category: "chairs", description: "New chair")]
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(leftNavigationButton: .back, rightNavigationButton: .search, leftNavigationButtonAction: {
                debugPrint("left")
            }, rightNavigationButtonAction: {
                debugPrint("search")
            })
            
            //create tableview
            List(items) { item in
                ProductListCellView(item: item)
            }
            .listStyle(GroupedListStyle())
            
        }
        .navigationBarHidden(true)
    }
}

struct ProductListingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProductListingView()
        }
    }
}
