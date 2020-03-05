//
//  DetailHeaderTableViewCell.swift
//  idus_test
//
//  Created by 이밝음 on 01/03/2020.
//  Copyright © 2020 이밝음. All rights reserved.
//

import UIKit

class DetailHeaderTableViewCell: UITableViewCell {
    
    var buttonCornerRadius : CGFloat = 6
    var appURL = ""
    var imageArray : [String] = []
     

    @IBOutlet weak var btnContainerView: UIView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var webViewBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var lineView: UIView!
    
    var parentView : UIViewController?
    
    var imageCount = 5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        
        lineView.backgroundColor = .lightGray
       
        btnContainerView.layer.cornerRadius = buttonCornerRadius
        btnContainerView.setStroke(color: .lightGray, weight: 1)
        
        
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(UINib(nibName: "DetailScreenshotImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailScreenshotImageCollectionViewCell")
        
        // Configure the view for the selected state
    }
    @IBAction func clickOpenWebBtn(_ sender: Any) {
        guard let url = URL(string: appURL) else { return }
        UIApplication.shared.open(url)
    }
    @IBAction func clickShareBtn(_ sender: Any) {
        shareActivity(parentView: parentView!, shareText:appURL )
    }
    
}

extension DetailHeaderTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailScreenshotImageCollectionViewCell", for: indexPath) as! DetailScreenshotImageCollectionViewCell
       
        setImageUrl(imageUrl: imageArray[indexPath.row], imageView: cell.screenshotImageView)
        return cell
    }
    
    
}
