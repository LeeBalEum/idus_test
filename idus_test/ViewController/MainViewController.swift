//
//  ViewController.swift
//  idius_test
//
//  Created by 이밝음 on 27/02/2020.
//  Copyright © 2020 이밝음. All rights reserved.
//

import UIKit

class MianViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var contentsCount = 9
    var selectIndex = 0
    
    var resultAppList : [SearchResults] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.barTintColor = .white
        let naviTitleLabel = UILabel (frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
        
        naviTitleLabel.textAlignment = .left
        naviTitleLabel.text = "핸드메이드"
        naviTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        self.navigationItem.titleView = naviTitleLabel
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        
//        APIClient.getArticles(term: "핸드메이드", completion: { result in
//            switch result {
//            case .success(let getAppList):
//                print(getAppList)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        })
        
        getSearchResults(term: "핸드메이드", completion: getData)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToDetailSg" {
            let openVC = segue.destination as! DetailViewController
            openVC.detailAppData = resultAppList[selectIndex]
        }
    }
    
    
    func getData(result : [SearchResults]) ->Void {
        if(result.count != 0) {
                print("데이터 있음")
            resultAppList = result
                
                tableView.reloadData()
            } else {
                print("데이터 없음")
            }
        }
    
}

extension MianViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        if resultAppList.count != 0 {
            cell.appNameLabel.text = resultAppList[indexPath.row].trackName
            cell.appComLabel.text = resultAppList[indexPath.row].sellerName
            setImageUrl(imageUrl: resultAppList[indexPath.row].artworkUrl512!, imageView: cell.thumbnailImageView)
            cell.appCategoryLabel.text = resultAppList[indexPath.row].primaryGenreName
            cell.appPriceLabel.text = resultAppList[indexPath.row].formattedPrice
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 150
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectIndex = indexPath.row
        self.performSegue(withIdentifier: "mainToDetailSg", sender: self)
    }
}
