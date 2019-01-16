//
//  CustomTableViewCell.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-11.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation
import UIKit

//Mark: Custom Collection Cell which links properties with Storybaord
class CollectionCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    internal override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
