//
//  Collects.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation

//Mark: Json Collects Object Model
class Collects : Codable {
    internal let collects: [Collect]
    
    init(collects: [Collect]){
        self.collects = collects
    }
}
