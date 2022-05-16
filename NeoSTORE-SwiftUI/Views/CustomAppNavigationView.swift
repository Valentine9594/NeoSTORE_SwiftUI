//
//  CustomAppNavigationView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 12/05/22.
//

import SwiftUI

struct CustomNavigationBar: View{
    var body: some View{
        NavigationView{
            ZStack{
                Color.green
                    .ignoresSafeArea(.all, edges: .top)
            }
            
            VStack{
                Rectangle()
                    .frame(height: 0)
                    .background(Color.green.opacity(0.2))
                Text("Touching text")
                    .padding()
                Spacer()
            }
            .navigationTitle("Custom Nav Bar")
            .font(.title2)
        }
    }
}
