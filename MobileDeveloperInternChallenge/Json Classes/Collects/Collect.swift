//
//  Collects.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation

//Mark: Json Collect Object Model
class Collect : Codable {
    internal let id : Int?
    internal let collection_id : Int?
    internal let product_id : Int?
    internal let featured : Bool?
    internal let created_at : String?
    internal let updated_at : String?
    internal let position : Int?
    internal let sort_value : String?
    
    init(id: Int, collection_id: Int, product_id: Int, featured: Bool, created_at: String, updated_at: String, position: Int, sort_value: String){
        self.id = id
        self.collection_id = collection_id
        self.product_id = product_id
        self.featured = featured
        self.created_at = created_at
        self.updated_at = updated_at
        self.position = position
        self.sort_value = sort_value
    }
}
