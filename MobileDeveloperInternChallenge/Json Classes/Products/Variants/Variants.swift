//
//  Variants.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation

//Mark: Json Variants Object Model
class Variants : Codable {
    internal let variants: [Variant]
    
    func calcInventory() -> Int {
        var inventory = 0
        for variant in variants {
            inventory += variant.inventory_quantity!
        }
        return inventory
    }
    
    init(variants: [Variant]){
        self.variants = variants
    }
}
