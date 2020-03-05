//
//  DetailTagCollectionView.swift
//  idus_test
//
//  Created by 이밝음 on 05/03/2020.
//  Copyright © 2020 이밝음. All rights reserved.
//

import UIKit

class DetailTagCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
