//
//  DetailCategoryCollectionViewCell.swift
//  idus_test
//
//  Created by 이밝음 on 05/03/2020.
//  Copyright © 2020 이밝음. All rights reserved.
//

import UIKit

class DetailCategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.setStroke(color: UIColor.darkGray, weight: 0.3)
        containerView.layer.cornerRadius = 4
        // Initialization code
    }

}
