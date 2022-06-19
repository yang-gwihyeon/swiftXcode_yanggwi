//
//  NewsData.swift
//  ServerJson_02
//
//  Created by TJ on 2022/06/19.
//

//
//  NewsData.swift
//  BadNewsGoodNews
//
//  Created by 양귀현 on 2022/03/04.
//

import Foundation

struct NewsData: Codable{
    var results: [Results]?
    
}



struct Results: Codable{
    var title: String?
//    let link: URL
//    let keywords: [String]
//    let creator: [String]
//    let video_url: URL
    var description: String?
//    et content: String
    var pubDate: String?
    var full_description: String?
//    let image_url: De
//    let source_id: String
//    let country: [String]
//    let category: [String]
//    let language: String
}




