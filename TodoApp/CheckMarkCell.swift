//
//  CheckMarkCell.swift
//  TodoApp
//
//  Created by Bingxu on 9/30/19.
//  Copyright © 2019 Bingxu. All rights reserved.
//

import UIKit

class CheckMarkCell: UITableViewCell {
    
    @IBOutlet weak var btnCheckMark: UIButton!
    @IBOutlet weak var labelItem: UILabel!
    @IBOutlet weak var dateItem: UILabel!
    @IBOutlet weak var timeItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
