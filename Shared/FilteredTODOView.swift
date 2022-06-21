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
    
    @State var sortBy = "date"
    @State var isAscending = false
    @State var showingSheet = false
    
    init(items firsts: Binding<[TODO]>, selected selectedItems: [TODO]) {
        _selectedDate = State(initialValue: Date())
        _items = firsts
        _selectedItems = State(initialValue: selectedItems)
    }
    
    func sortList(by sortBy: String, ord isAscending: Bool){
        switch sortBy{
            case "date":
            selectedItems.sort  {
                    isAscending ? $0.date < $1.date : $0.date > $1.date
                }
            case "name":
            selectedItems.sort {
                    isAscending ? $0.title < $1.title : $0.title > $1.title
                }
        default:
            break
        }
        
    }
    
    var body: some View {
        VStack{
            DatePicker("filter date", selection: $selectedDate, displayedComponents: .date)
                .onChange(of: selectedDate, perform: {item in
                    selectedItems = items.filter { obj in
                        Calendar.current.dateComponents([.day, .month, .year], from: selectedDate) == Calendar.current.dateComponents([.day, .month, .year], from: obj.date)
                    }
                })
            HStack {
                Button("Sort by") {
                    showingSheet.toggle()
                }.sheet(isPresented: $showingSheet){
                    Text("date asc").onTapGesture {
                        sortList(by: "date", ord: true)
                        showingSheet.toggle()
                    }
                    Text("date des").onTapGesture {
                        sortList(by: "date", ord: false)
                        showingSheet.toggle()
                    }
                    Text("name asc").onTapGesture {
                        sortList(by: "date", ord: true)
                        showingSheet.toggle()
                    }
                    Text("name des").onTapGesture {
                        sortList(by: "date", ord: false)
                        showingSheet.toggle()
                    }
                }

            }
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

