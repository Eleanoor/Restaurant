//  Minor Programmeren, App Studio
//
//  MenuItem.swift
//  Restaurant
//
//  Created by Eleanoor Polder on 07-05-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  Structs.

import Foundation

// Struct MenuItems.
struct MenuItem: Codable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case category
        case imageURL = "image_url"
    }
}

// Struct
struct MenuItems: Codable {
    let items: [MenuItem]
}
