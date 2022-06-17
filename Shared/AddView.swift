//
//  AddView.swift
//  TODOApp
//
//  Created by Macvps on 6/17/22.
//

import SwiftUI

struct AddView: View {
    
    @State var title: String = ""
    @State var description: String = ""
    @State var date: Date = Date()
    @Binding var items: [TODO]
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        Form {
            TextField("title", text: $title)
            TextField("Description", text: $description)
            DatePicker("date", selection: $date)
        }
        .padding()
        .navigationTitle("New Form")
        .navigationBarItems(trailing: Button{
            let newItem: TODO = TODO(date: date, title: title, description: description)
            items.append(newItem)
            mode.wrappedValue.dismiss()
        } label: {
            Text("submit")
        }
                            )
    }
}
