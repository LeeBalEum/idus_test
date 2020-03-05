//
//  HomeTableViewCell.swift
//  idius_test
//
//  Created by 이밝음 on 27/02/2020.
//  Copyright © 2020 이밝음. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var starImageView1: UIImageView!
    @IBOutlet weak var starImageView2: UIImageView!
    @IBOutlet weak var starImageView3: UIImageView!
    @IBOutlet weak var starImageView4: UIImageView!
    @IBOutlet weak var starImageView5: UIImageView!
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appComLabel: UILabel!
    @IBOutlet weak var appCategoryLabel: UILabel!
    @IBOutlet weak var appPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        containerView.layer.cornerRadius = 5
        thumbnailImageView.layer.cornerRadius = 5
        if #available(iOS 11.0, *) {
            thumbnailImageView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        } else {
            thumbnailImageView.roundCorners(corners: [.topLeft,.topRight], radius: 5)
        }
        containerView.setStroke(color: .lightGray, weight: 0.2)
        titleContainerView.setStroke(color: .lightGray, weight: 0.2)
        // Configure the view for the selected state
    }
    
}
