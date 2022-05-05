//
//  ContentView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .alignmentGuide(.top, computeValue: { dimension in
                .infinity
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
