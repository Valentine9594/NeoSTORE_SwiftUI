//
//  ContentView.swift
//  NeoSTORE-SwiftUI
//
//  Created by neosoft on 04/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView{
            NavigationLink(destination: Text("Second VIEW")) {
                Image(systemName: "person.fill")
            }
            .navigationTitle("Regis")
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
