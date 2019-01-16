//
//  CustomCollection.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation

//Mark: Json Collection Object Model
class CustomCollection : Codable {
    internal let id : Int?
    internal let handle : String?
    internal let title : String?
    internal let updated_at : String?
    internal let body_html : String?
    internal let published_at : String?
    internal let sort_order : String?
    internal let template_suffix : String?
    internal let published_scope : String?
    internal let admin_graphql_api_id : String?
    internal let image : Image?
    
    init(id: Int, handle: String, title: String, updated_at: String, body_html: String, published_at: String, sort_order: String, template_suffix: String, published_scope: String, admin_graphql_api_id: String, image: Image){
        self.id = id
        self.handle = handle
        self.title = title
        self.updated_at = updated_at
        self.body_html = body_html
        self.published_at = published_at
        self.sort_order = sort_order
        self.template_suffix = template_suffix
        self.published_scope = published_scope
        self.admin_graphql_api_id = admin_graphql_api_id
        self.image = image
    }
}
