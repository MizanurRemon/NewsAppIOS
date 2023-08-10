//
//  NewsResponse.swift
//  NewsAppIOS
//
//  Created by Mizanur Remon on 11/7/23.
//

//import Foundation


struct NewsResponse: Codable{
    let status: String
    let articles: [Articles]
    
}


struct Articles: Codable{
    let source : Source
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
    let author : String?
    let content : String?
}


struct Source: Codable{
    let id : String?
    let name : String?
}
