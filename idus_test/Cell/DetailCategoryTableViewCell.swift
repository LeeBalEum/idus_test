//
//  DetailCategoryTableViewCell.swift
//  idus_test
//
//  Created by 이밝음 on 02/03/2020.
//  Copyright © 2020 이밝음. All rights reserved.
//

import UIKit

class DetailCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var tagCollectionView: UICollectionView!
    
    var genres:[String] = []
    
    var parentView : DetailViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 160, height: 60)
        tagCollectionView.collectionViewLayout = layout
        
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        tagCollectionView.register(UINib(nibName: "DetailCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailCategoryCollectionViewCell")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension DetailCategoryTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCategoryCollectionViewCell", for: indexPath) as! DetailCategoryCollectionViewCell
        cell.categoryLabel.text = "#" + genres[indexPath.row]
        return cell
    }
    
   
}

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }

            layoutAttribute.frame.origin.x = leftMargin

            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }

        return attributes
    }
    
}
