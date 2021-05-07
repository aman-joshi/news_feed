//
//  APIManager.swift
//  NewFeed
//
//  Created by Mohd Maruf on 06/05/21.
//

import Foundation

class ApiManager {

  static let shared = ApiManager()
  private let session = URLSession.shared

  private init() {}

  func fetchNews(from endpoint:String, completion:@escaping (NewsModel?,Error?) -> Void) {
    guard  let url = URL(string: EndPoints.baseUrl+endpoint) else { return }
    print(url)

    session.dataTask(with: url) { (data, response, error) in
      DispatchQueue.main.async {
        if error != nil {
          print("Error while fetching - \(error!.localizedDescription)")
          completion(nil,error)
        }
        else {
          do {
            let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            if let json = jsonObject as? JSON {
              let newsModel = NewsModel(jsonObject: json)
              completion(newsModel,nil)
            }
          } catch {
            print(error.localizedDescription)
            completion(nil,error)
          }
        }
      }
    }.resume()
  }

}
