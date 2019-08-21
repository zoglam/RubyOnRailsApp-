//
//  TodoCellTableViewCell.swift
//  RubyIOS
//
//  Created by Anzor on 18.08.2019.
//  Copyright © 2019 Anzor. All rights reserved.
//

import UIKit
import M13Checkbox

class TodoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var checkbox13: M13Checkbox!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
