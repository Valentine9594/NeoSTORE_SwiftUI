//
//  ProductListingView.swift
//  NeoSTORE-SwiftUI
//
//  Created by Apple on 25/07/22.
//

import SwiftUI

struct ProductListingView: View {
    @Environment(\.presentationMode) var presentation
    let productCategory: ProductCategories
    let items = [ProductModel(id: "1", name: "1", category: "chairs", description: "New chair"), ProductModel(id: "2", name: "2", category: "chairs", description: "New chair"), ProductModel(id: "3", name: "3", category: "chairs", description: "New chair")]
    
    init(productCategory: ProductCategories) {
        self.productCategory = productCategory
//        setupCompletionHandlers()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(title: productCategory.description, leftNavigationButton: .back, rightNavigationButton: .search, leftNavigationButtonAction: {
                debugPrint("left")
                self.presentation.wrappedValue.dismiss()
            }, rightNavigationButtonAction: {
                debugPrint("Searching...")
            })
            
            List(items) { item in
                ProductListCellView(item: item)
            }
            .listStyle(InsetListStyle())
            
        }
        .navigationBarHidden(true)
    }
    
    func leftNavigationButtonAction() {
        self.presentation.wrappedValue.dismiss()
    }
    
//    private mutating func setupCompletionHandlers() {
//        self.leftNavigationButtonCompletionHandler = {
//            self.presentation.wrappedValue.dismiss()
//        }
//
//        self.rightNavigationButtonCompletionHandler = {
//
//        }
//    }
}

struct ProductListingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProductListingView(productCategory: .table)
        }
    }
}
