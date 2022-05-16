//
//  HomeView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 12/05/22.
//

import SwiftUI

struct HomeView: View {
    var carousel: CarouselImages
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            Color.white
           
            carousel.image
                .resizable()
                .aspectRatio(3/2, contentMode: .fit)

            Text("Hello")
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let carouselArray = [CarouselImages(name: "slider_img1", imageName: "slider_img1"), CarouselImages(name: "slider_img2", imageName: "slider_img2"), CarouselImages(name: "slider_img3", imageName: "slider_img3"), CarouselImages(name: "slider_img4", imageName: "slider_img4")]
        HomeView(carousel: carouselArray[0])
            .environment(\.sizeCategory, .extraExtraLarge)
            .previewLayout(.fixed(width: 396.0, height: /*@START_MENU_TOKEN@*/800.0/*@END_MENU_TOKEN@*/))            
    }
}




