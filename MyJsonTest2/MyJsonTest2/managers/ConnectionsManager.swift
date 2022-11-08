//
//  ConnectionsManager.swift
//  MyJsonTest2
//
//  Created by Johnson Liu on 11/7/22.
//

import UIKit
import Alamofire
import SwiftyJSON


class ConnectionsManager: NSObject {
    
    func getDataFromUrl(url: String, completion: @escaping (_ json: Any) -> Void) {
        
        AF.request(url).responseData { response in
            switch response.result {
            case let .success(value):
                completion(value)
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
