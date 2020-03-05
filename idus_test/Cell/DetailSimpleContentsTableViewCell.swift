//
//  DetailSimpleContentsTableViewCell.swift
//  idus_test
//
//  Created by 이밝음 on 01/03/2020.
//  Copyright © 2020 이밝음. All rights reserved.
//

import UIKit

class DetailSimpleContentsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
