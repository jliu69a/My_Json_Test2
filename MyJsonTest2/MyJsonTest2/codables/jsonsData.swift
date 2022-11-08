//
//  jsonsData.swift
//  MyJsonTest2
//
//  Created by Johnson Liu on 11/7/22.
//

import UIKit

public struct Book: Codable {
    var id: String?
    var title: String?
    var notes: String?
    var author: Author?
}

public struct Author: Codable {
    var id: String?
    var last_name: String?
    var first_name: String?
    var location: Location?
}

public struct Location: Codable {
    var id: String?
    var city: String?
    var nation: String?
}
