//
//  CustomCollections.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation

//Mark: Json Collections Object Model
class Custom_collections : Codable {
    internal let custom_collections: [CustomCollection]
    
    init(custom_collections: [CustomCollection]){
        self.custom_collections = custom_collections
    }
}
