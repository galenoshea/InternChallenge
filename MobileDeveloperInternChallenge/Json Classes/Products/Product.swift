//
//  Product.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation

//Mark: Json Product Object Model
class Product : Codable {
    internal let id : Int
    internal let title : String
    internal let body_html : String
    internal let vendor : String
    internal let product_type : String
    internal let created_at : String
    internal let handle : String
    internal let updated_at : String
    internal let published_at : String
    internal let template_suffix : String?
    internal let tags : String
    internal let published_scope : String
    internal let admin_graphql_api_id : String
    internal let variants : [Variant]
    internal let options : [Option]
    internal let images : [ProductImage]
    internal let image : ProductImage
    
    init(id: Int, title: String, body_html: String, vendor: String, product_type: String, created_at: String, handle: String, updated_at: String, published_at: String, template_suffix: String, tags: String, published_scope: String, admin_graphql_api_id: String, variants: [Variant], options: [Option], images: [ProductImage], image: ProductImage ) {
        self.id = id
        self.title = title
        self.body_html = body_html
        self.vendor = vendor
        self.product_type = product_type
        self.created_at = created_at
        self.handle = handle
        self.updated_at = updated_at
        self.published_at = published_at
        self.template_suffix = template_suffix
        self.tags = tags
        self.published_scope = published_scope
        self.admin_graphql_api_id = admin_graphql_api_id
        self.variants = variants
        self.options = options
        self.images = images
        self.image = image
    }
    
    //Mark: Used to calculate total inventory amongst product variants
    internal func calcInventory() -> Int {
        var inventory = 0
        for variant in variants {
            inventory += variant.inventory_quantity!
        }
        return inventory
    }
    
    //Mark: Used to form  dictionary from object model for Product details Controller
    internal func listDetails(_ i : Int) -> String {
        let mirroredProduct = Mirror(reflecting: self)
        var details = ""
        
        for (index, attr) in mirroredProduct.children.enumerated() {
            if (index == i) {
               details = "\(attr.label!): \(attr.value)"
            }
        }
        return details
    }
    
    //Mark: return count of details
    internal func detailsCount()-> Int{
        return Mirror(reflecting: self).children.count
    }
    
}
