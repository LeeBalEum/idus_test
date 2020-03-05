//
//  CodableDecoding.swift
//  idus_test
//
//  Created by 이밝음 on 02/03/2020.
//  Copyright © 2020 이밝음. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

func getSearchResults(term : String, completion : @escaping ([SearchResults]) -> Void) {
    let apiURL = (APIAddress.baseURL+term).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    let doNetwork = AF.request(apiURL!)
    
    doNetwork.responseJSON { (response) in
        switch response.result {
        case .success(let result):
            do {
                let dataJSON : Data?
                if #available(iOS 11.0, *) {
                    dataJSON = try JSONSerialization.data(withJSONObject: result, options: .sortedKeys)
                } else {
                    dataJSON = try JSONSerialization.data(withJSONObject: result)
                }
                let getInstantceData = try JSONDecoder().decode(RootData.self, from: dataJSON!)
                completion(getInstantceData.results)

            } catch {
                print("에러 메세지")
                print(error.localizedDescription)
            }
        case .failure(let error):
            print(error.localizedDescription)

        }
    }
}


struct APIAddress {
   static let baseURL = "https://itunes.apple.com/search?country=kr&media=software&term="
//    String("https://itunes.apple.com/search?country=kr&media=software&term=").addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

enum APIRouter: URLRequestConvertible {
    
    case posts
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .posts:
            return .get
        }
    }
    
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try APIAddress.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
 
      
        
        return urlRequest
    }
}
