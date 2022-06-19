//
//  JSONModel.swift
//  ServerJson_01
//
//  Created by TJ on 2022/06/19.
//

import Foundation

// JSON Codable : JSON file Decoding

struct StudentJSON: Codable {
    
    var code: String
    var phone: String
    var name: String
    var dept: String
    
}
