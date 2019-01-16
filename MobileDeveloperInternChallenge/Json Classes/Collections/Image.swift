//
//  Image.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation

//Mark: Json Collection Image Object Model
class Image : Codable{
    internal let created_at : String?
    internal let alt : String?
    internal let width : Int?
    internal let height : Int?
    internal let src : String?
    
    init(created_at: String, alt: String, width: Int, height: Int, src: String) {
        self.created_at = created_at
        self.alt = alt
        self.width = width
        self.height = height
        self.src = src
        print(self.src!)
    }
}
