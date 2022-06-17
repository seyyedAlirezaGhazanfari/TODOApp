//
//  ContentView.swift
//  Shared
//
//  Created by Macvps on 6/16/22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView{
            AllTODOView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("ALL")
                }
            FilteredTODOView()
                .tabItem({
                    Label("filter"
                          , systemImage: "person.crop.circle.fill")
                })
        }.padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
