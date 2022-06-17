//
//  AllTODOView.swift
//  TODOApp
//
//  Created by Macvps on 6/16/22.
//

import SwiftUI

struct AllTODOView: View {
    
    @State var items: [TODO] = [ TODO(date: Date(), id: 0, title: "WORK1", description: "This is good!")]
    var body: some View {
        NavigationView{
        List(items){item in
            Text(item.title)
        }
            .navigationTitle("TODO LIST")
            
        }
        
    }
}

struct AllTODOView_Previews: PreviewProvider {
    static var previews: some View {
        AllTODOView()
    }
}
