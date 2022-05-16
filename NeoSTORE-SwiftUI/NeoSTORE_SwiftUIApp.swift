//
//  NeoSTORE_SwiftUIApp.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import SwiftUI

@main
struct NeoSTORE_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
//            LoginView()

            let carouselArray = [CarouselImages(name: "slider_img1", imageName: "slider_img1"), CarouselImages(name: "slider_img2", imageName: "slider_img2"), CarouselImages(name: "slider_img3", imageName: "slider_img3"), CarouselImages(name: "slider_img4", imageName: "slider_img4")]
            HomeView(carousel: carouselArray[0])
        }
    }
}
