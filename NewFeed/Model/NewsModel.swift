//
//  NewsModel.swift
//  NewFeed
//
//  Created by Mohd Maruf on 06/05/21.
//

import Foundation

struct NewsModel {
  var status = false
  var totalResults:Int = 0
  var articles = [Article]()

  init(jsonObject:JSON) {
    self.status = (jsonObject["status"] != nil)
    self.totalResults = jsonObject["totalResults"] as! Int
    
    if let jsonArray = jsonObject["articles"] as? [JSON] {
      print("Number of articles - \(jsonArray.count)")
      for article in jsonArray {
        let articleModel = Article(author: article["author"] as? String, title: article["title"] as! String, description: article["description"] as? String, url: article["url"] as? String, urlToImage: article["urlToImage"] as? String, publishedAt: article["publishedAt"] as! String, content: article["content"] as? String)
        self.articles.append(articleModel)
      }
    }
  }
}

struct Article:Identifiable,Hashable {
  let id = UUID()
  let author:String?
  let title:String
  let description:String?
  let url:String?
  let urlToImage:String?
  let publishedAt:String
  let content:String?
}


