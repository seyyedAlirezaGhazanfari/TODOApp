//
//  Model.swift
//  TODOApp
//
//  Created by Macvps on 6/16/22.
//

import Foundation


struct TODO: Identifiable {
    var date: Date
    var id = UUID()
    var title: String
    var description: String
}
