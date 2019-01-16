//
//  Option.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation

//Mark: Json Option Object Model
class Option : Codable {
    internal let id : Int?
    internal let product_id : Int?
    internal let name : String?
    internal let position : Int?
    internal let values : [String]?
    
    init(id: Int, product_id: Int, name: String, position: Int, values: [String]){
        self.id = id
        self.product_id = product_id
        self.name = name
        self.position = position
        self.values = values
    }
}
