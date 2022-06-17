//
//  AllTODOView.swift
//  TODOApp
//
//  Created by Macvps on 6/16/22.
//

import SwiftUI

struct AllTODOView: View {
    
    @Binding var items: [TODO]
    let dateFormatter: DateFormatter = DateFormatter()
    init(sItems items: Binding<[TODO]>) {
        self._items = items
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long
    }
    var body: some View {
        List{
            ForEach(items){item in
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
                Text(dateFormatter.string(from: item.date))
            }
            }
            .onDelete { itemIndex in
                items.remove(atOffsets: itemIndex)
            }
        }
            
        }
}

