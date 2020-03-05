//
//  Codable.swift
//  idus_test
//
//  Created by 이밝음 on 01/03/2020.
//  Copyright © 2020 이밝음. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


enum BackendError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}



struct SearchResults: Codable {
    var screenshotUrls : [String]?
    var trackViewUrl : String?
    var description : String?
    var formattedPrice : String?
    var trackName : String?
    var trackContentRating : String?
    var artworkUrl512 : String?
    var genres : [String]?
    var sellerName : String?
    var version : String?
    var fileSizeBytes : String?
    var releaseNotes : String?
    var primaryGenreName : String?

}
extension SearchResults {
    enum CodingKeys: String, CodingKey {
        case screenshotUrls
        case trackViewUrl
        case description
        case formattedPrice
        case trackName
        case trackContentRating
        case artworkUrl512
        case genres
        case sellerName
        case version
        case fileSizeBytes
        case releaseNotes
        case primaryGenreName
    }

}

struct RootData :Codable {
    var results : [SearchResults]
}


