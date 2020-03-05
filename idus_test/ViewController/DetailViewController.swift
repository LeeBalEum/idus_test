//
//  DetailViewController.swift
//  idus_test
//
//  Created by 이밝음 on 01/03/2020.
//  Copyright © 2020 이밝음. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var detailAppData : SearchResults?
    
    var isMoreViewYn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "핸드메이드"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DetailHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailHeaderTableViewCell")
        tableView.register(UINib(nibName: "DetailSimpleContentsTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailSimpleContentsTableViewCell")
        tableView.register(UINib(nibName: "DetailNewFunctionTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailNewFunctionTableViewCell")
        tableView.register(UINib(nibName: "DetailAppExplainTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailAppExplainTableViewCell")
        tableView.register(UINib(nibName: "DetailCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailCategoryTableViewCell")
        
    }
    
    
    
    
}


extension DetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            //이미지 + 버튼 해더뷰
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailHeaderTableViewCell", for: indexPath) as! DetailHeaderTableViewCell
            cell.selectionStyle = .none
            cell.parentView = self
            cell.appURL = detailAppData!.trackViewUrl!
            cell.imageArray = detailAppData!.screenshotUrls!
            cell.priceLabel.text = detailAppData!.formattedPrice!
            cell.companyNameLabel.text = detailAppData!.sellerName!
            cell.appNameLabel.text = detailAppData!.trackName
            cell.imageCollectionView.reloadData()
            return cell
        } else if indexPath.row == 1 {
            //크기
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSimpleContentsTableViewCell", for: indexPath) as! DetailSimpleContentsTableViewCell
            cell.selectionStyle = .none
            cell.titleLabel.text = "크기"
            cell.contentsLabel.text = changeByteToMB(byte: Double(detailAppData!.fileSizeBytes!)!) + "MB"
            cell.arrowImageView.isHidden = true
            return cell
        } else if indexPath.row == 2 {
            //연령
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSimpleContentsTableViewCell", for: indexPath) as! DetailSimpleContentsTableViewCell
            cell.selectionStyle = .none
            cell.titleLabel.text = "연령"
            cell.contentsLabel.text = detailAppData!.trackContentRating!
            cell.arrowImageView.isHidden = true
            return cell
        } else if indexPath.row == 3 {
            //새로운 기능
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSimpleContentsTableViewCell", for: indexPath) as! DetailSimpleContentsTableViewCell
            cell.selectionStyle = .none
            cell.titleLabel.text = "새로운 기능"
            cell.contentsLabel.text = detailAppData!.version!
            cell.arrowImageView.isHidden = false
            if isMoreViewYn == false {
                cell.arrowImageView.image = UIImage(named: "down-arrow")
            } else {
                cell.arrowImageView.image = UIImage(named: "up-arrow")
            }
            
            return cell
        } else if indexPath.row == 4 {
            //새로운 기능 상세 내용
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNewFunctionTableViewCell", for: indexPath) as! DetailNewFunctionTableViewCell
            cell.selectionStyle = .none
            cell.contentsLabel.text = detailAppData!.releaseNotes!
            
            return cell
        } else if indexPath.row == 5 {
            //앱 설명
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailAppExplainTableViewCell", for: indexPath) as! DetailAppExplainTableViewCell
            cell.selectionStyle = .none
            cell.contentsLabel.text = detailAppData!.description!
            return cell
            
        } else if indexPath.row == 6 {
            //카테고리
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCategoryTableViewCell", for: indexPath) as! DetailCategoryTableViewCell
            cell.selectionStyle = .none
            cell.genres = detailAppData!.genres!
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 100
        if indexPath.row == 0 {
            //이미지 + 버튼 해더뷰
            return 412
        } else if indexPath.row == 1 {
            //크기
            return 48
        } else if indexPath.row == 2 {
            //연령
            return 48
        } else if indexPath.row == 3 {
            //새로운 기능
            return 48
        } else if indexPath.row == 4 {
            //새로운 기능 상세 내용
            if isMoreViewYn == false {
                return 0
            } else {
                return UITableView.automaticDimension
            }
            
        } else if indexPath.row == 5 {
            //앱 설명
            return UITableView.automaticDimension
        } else if indexPath.row == 6 {
            //카테고리
            return UITableView.automaticDimension
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            if isMoreViewYn == false {
                isMoreViewYn = true
            } else {
                isMoreViewYn = false
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        }
        
    }
    
    
}
