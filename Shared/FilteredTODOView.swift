//
//  FilteredTODOView.swift
//  TODOApp
//
//  Created by Macvps on 6/16/22.
//

import SwiftUI

struct FilteredTODOView: View {
    
    @Binding var items: [TODO]
    @State var selectedItems: [TODO]
    @State var selectedDate: Date
    
    init(items firsts: Binding<[TODO]>, selected selectedItems: [TODO]) {
        _selectedDate = State(initialValue: Date())
        _items = firsts
        _selectedItems = State(initialValue: selectedItems)
    }
    
    var body: some View {
        VStack{
            DatePicker("filter date", selection: $selectedDate, displayedComponents: .date)
                .onChange(of: selectedDate, perform: {item in
                    selectedItems = items.filter { obj in
                        Calendar.current.dateComponents([.day, .month, .year], from: selectedDate) == Calendar.current.dateComponents([.day, .month, .year], from: obj.date)
                    }
                })
            List{
                ForEach(selectedItems){item in
                    VStack(alignment: .leading){
                    Text(item.title)
                        .font(.title)
                    Text(item.description)
                        .font(.title2)
                    Text(item.date, style: .date)
                        .font(.title2)
                }
                }
                .onDelete { indexs in
                    indexs.forEach { (i) in
                        items.removeAll { item in
                            item.id == selectedItems[i].id
                        }
                    }
                    selectedItems.remove(atOffsets: indexs)
                    
                }
            }
        }
                
    }
}
