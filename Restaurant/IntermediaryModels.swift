//  Minor Programmeren, AppStudio
//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Eleanoor Polder on 07-05-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import Foundation

// Struct Categories.
struct Categories: Codable {
    let categories: [String]
}

// Struct PraparationTime.
struct PreparationTime: Codable {
    let prepTime: Int

    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
