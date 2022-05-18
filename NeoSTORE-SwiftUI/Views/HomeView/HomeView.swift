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
        VStack(spacing: 0){
//            NavigationView{
//                HStack{
//                    Text("NeoSTORE")
//                        .navigationBarTitleDisplayMode(.inline)
//                }
//            }
//            .background(Color.appRed)
//            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height*0.1)
            
            HStack{
                Button {
                    debugPrint("Clicked Button")
                } label: {
                    Image("menu_icon")
                }
                .padding(.leading, 8)
                .frame(height: UIScreen.main.bounds.size.height*0.08)
                
                Spacer()

                Text("NeoSTORE")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: UIScreen.main.bounds.size.height*0.08)
                
                Spacer()
                
                Button {
                    debugPrint("Clicked Button")
                } label: {
                    Image("search_icon")
                }
                .padding(.trailing, 8)
                .frame(height: UIScreen.main.bounds.size.height*0.08)
            }
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height*0.08)
            .background(Color.appRed)
            
            CarouselView(carouselImages: carouselImages, currentPage: $currentPage)
                .padding(.bottom, 15)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.35)
            
            LazyHGrid(rows: [GridItem(.flexible(minimum: (UIScreen.main.bounds.size.width/2)-33), spacing: 12), GridItem(.flexible(minimum: (UIScreen.main.bounds.size.width/2)-33), spacing: 12)], spacing: 12) {
                ForEach((1...ProductCategories.allCases.count), id: \.self) { index in
                    Image(ProductCategories(rawValue: index)?.imageName ?? "chairsicon")
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .onTapGesture {
                            debugPrint("Clicked \(index): \(ProductCategories(rawValue: index)?.description ?? "Nothing")")
                        }
                }
            }
            .frame(width: .infinity, height: .infinity)
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            
            Spacer()
        }
        .frame(width: .infinity, height: .infinity)
    }
}
    


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}