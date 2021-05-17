//
//  Article.swift
//  NewsHunter
//
//  Created by Zheng Zhou on 2021/5/17.
//

import Foundation

struct Article: Codable{
    var source: Source
    var author: String!
    var title: String
    var description: String
    var url: String
    var urlToImage: String!
    var publishedAt: String
    var content: String
    
}

struct Source: Codable{
    var name: String
}
