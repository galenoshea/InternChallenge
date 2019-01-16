//
//  Variant.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation

//Mark: Json Variant Object Model
class Variant : Codable {
    internal let id : Int?
    internal let product_id : Int?
    internal let title : String?
    internal let price : String?
    internal let sku : String?
    internal let position : Int?
    internal let inventory_policy : String?
    internal let compare_at_price : String?
    internal let fulfillment_service : String?
    internal let inventory_management : String?
    internal let option1 : String?
    internal let option2 : String?
    internal let option3 : String?
    internal let created_at : String?
    internal let updated_at : String?
    internal let taxable : Bool?
    internal let barcode : String?
    internal let grams : Int?
    internal let image_id : String?
    internal let weight : Double?
    internal let weight_unit : String?
    internal let inventory_item_id : Int?
    internal let inventory_quantity : Int?
    internal let old_inventory_quantity : Int?
    internal let requires_shipping : Bool?
    internal let admin_graphql_api_id : String?
    
    init(id : Int, product_id : Int, title : String, price : String, sku : String, position : Int, inventory_policy : String, compare_at_price : String, fulfillment_service : String, inventory_management : String, option1 : String, option2 : String, option3 : String, created_at : String, updated_at : String, taxable : Bool, barcode : String, grams : Int, image_id : String, weight : Double, weight_unit : String, inventory_item_id : Int, inventory_quantity : Int, old_inventory_quantity : Int, requires_shipping : Bool, admin_graphql_api_id : String){
        self.id = id
        self.product_id = product_id
        self.title = title
        self.price = price
        self.sku = sku
        self.position = position
        self.inventory_policy = inventory_policy
        self.compare_at_price = compare_at_price
        self.fulfillment_service = fulfillment_service
        self.inventory_management = inventory_management
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.created_at = created_at
        self.updated_at = updated_at
        self.taxable = taxable
        self.barcode = barcode
        self.grams = grams
        self.image_id = image_id
        self.weight = weight
        self.weight_unit = weight_unit
        self.inventory_item_id = inventory_item_id
        self.inventory_quantity = inventory_quantity
        self.old_inventory_quantity = old_inventory_quantity
        self.requires_shipping = requires_shipping
        self.admin_graphql_api_id = admin_graphql_api_id
    }
    

}
