//
//  PageControl.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 16/05/22.
//

import SwiftUI

struct PageControl: UIViewRepresentable{
    @Binding var currentPageNumber: Int
    var numberOfPages: Int
    
    func makeUIView(context: Context) -> some UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        return pageControl
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.currentPage = currentPageNumber
    }
}
