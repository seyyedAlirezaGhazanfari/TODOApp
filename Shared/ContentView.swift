//
//  ContentView.swift
//  Shared
//
//  Created by Macvps on 6/16/22.
//

import SwiftUI

struct ContentView: View {
    @State var items: [TODO] = []

    @State var selection: Int = 0
    var body: some View {
        NavigationView{
        TabView(selection: $selection){
            AllTODOView(sItems: $items)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("ALL")
                }
                .tag(1)
                
            FilteredTODOView(items: $items)
                .tabItem({
                    Label("filter"
                          , systemImage: "person.crop.circle.fill")
                })
                .tag(2)
        }.padding()
                .navigationTitle(selection == 2 ? "FILTER" : "ALL")
                .navigationBarItems(
                    trailing: selection == 2 ? nil : NavigationLink(destination: AddView(items: $items), label: {Image(systemName: "plus")}))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
