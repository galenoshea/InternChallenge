//
//  DetailCell.swift
//  MobileDeveloperInternChallenge
//
//  Created by Galen O'Shea on 2019-01-14.
//  Copyright © 2019 Galen O'Shea. All rights reserved.
//

import Foundation
import UIKit

//Mark: Custom Detail Cell which links properties with Storybaord
class DetailCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellDetail: UILabel!
    
    internal override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
