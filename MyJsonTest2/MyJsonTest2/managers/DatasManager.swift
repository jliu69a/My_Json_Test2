//
//  DatasManager.swift
//  MyJsonTest2
//
//  Created by Johnson Liu on 11/7/22.
//

import UIKit
import SwiftyJSON

class DatasManager: NSObject {
    
    func booksData(completion: @escaping (Data?)->()) {
        
        let connect = ConnectionsManager()
        let url = "http://www.mysohoplace.com/php_hdb/testing/load_data.php"
        
        connect.getDataFromUrl(url: url) { (rawData: Any) in
            let bookData = rawData as? Data
            completion(bookData)
        }
    }
}
