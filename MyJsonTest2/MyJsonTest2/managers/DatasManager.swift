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
    
    func booksSessionData(completion: @escaping (Data)->()) {
        
        //-- not using Alamofire or SwiftJSON
        
        let url = URL(string: "http://www.mysohoplace.com/php_hdb/testing/load_data.php")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            completion(data)
        }
        task.resume()
    }
}
