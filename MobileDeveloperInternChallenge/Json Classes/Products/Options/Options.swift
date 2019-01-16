//
//  Options.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation

//Mark: Json Options Object Model
class Options : Codable {
    internal let options: [Option]
    
    init(options: [Option]){
        self.options = options
    }
}
