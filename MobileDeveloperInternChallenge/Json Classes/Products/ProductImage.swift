//
//  ProductImage.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation

//Mark: Json Product Image Object Model
class ProductImage : Codable {
    internal let id : Int?
    internal let product_id : Int?
    internal let position : Int?
    internal let created_at : String?
    internal let updated_at : String?
    internal let alt : String?
    internal let width : Int?
    internal let height : Int?
    internal let src : String?
    internal let variant_ids: [Int]?
    internal let admin_graphql_api_id : String?
    
    init(id : Int, product_id : Int, position : Int, created_at : String, updated_at : String, alt : String, width : Int, height : Int, src : String, variant_ids: [Int], admin_graphql_api_id : String){
        self.id = id
        self.product_id = product_id
        self.position = position
        self.created_at = created_at
        self.updated_at = updated_at
        self.alt = alt
        self.width = width
        self.height = height
        self.src = src
        self.variant_ids = variant_ids
        self.admin_graphql_api_id = admin_graphql_api_id
    }
}
