//
//  ContentView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        GeometryReader(content: { geometry in
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack{
                    Text("Top")
                    Spacer()
                    HStack{
                        Text("Leading")
                        Spacer()
                        Text("Trailing")
                    }
                    Spacer()
                    Text("Bottom")
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            })
        })
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
