//
//  PageView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 16/05/22.
//

import SwiftUI

struct PageView<Page: View>: View{
    var pages: [Page]
    @State private var currentPageNumber: Int = 0
    
    var body: some View{
        ZStack(alignment: .center) {
            PageViewController(pages: pages, currentPageNumber: $currentPageNumber)
            
            PageControl(currentPageNumber: $currentPageNumber, numberOfPages: pages.count)
                .frame(width: CGFloat(pages.count * 18), height: 20, alignment: .bottom)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        
        let carouselArray = [CarouselImages(name: "slider_img1", imageName: "slider_img1"), CarouselImages(name: "slider_img2", imageName: "slider_img2"), CarouselImages(name: "slider_img3", imageName: "slider_img3"), CarouselImages(name: "slider_img4", imageName: "slider_img4")]

        PageView(pages: carouselArray.map{ HomeView(carousel: $0).aspectRatio(3/2, contentMode: .fit) })
    }
}
