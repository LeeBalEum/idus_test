//
//  Function.swift
//  idus_test
//
//  Created by 이밝음 on 06/03/2020.
//  Copyright © 2020 이밝음. All rights reserved.
//

import Foundation
import UIKit
import Nuke

func setImageUrl(imageUrl:String, imageView: UIImageView) {
    
    let url = URL(string: imageUrl)
    
    if url == nil {
        print(imageUrl)
    }
    if imageUrl != "" && imageUrl != "null" && imageUrl != nil && url != nil {
        Nuke.loadImage(
            with: url!,
            options: ImageLoadingOptions(
                placeholder: nil,
                transition: .fadeIn(duration: 0.33)
            ),
            into: imageView
        )
    }else {
        imageView.image = UIImage()
    }
}

func shareActivity(parentView:UIViewController, shareText : String) {
    print("shareActivity")
    
    let textToShare = [ shareText ]
    let activityVC = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
    activityVC.excludedActivityTypes = [ UIActivity.ActivityType.airDrop ]
    parentView.present(activityVC, animated: true, completion: nil)
}

func changeByteToMB(byte:Double) -> String {
    var MB = ""
    MB = String(Int(round(byte/1048576)))
    
    return MB
}
