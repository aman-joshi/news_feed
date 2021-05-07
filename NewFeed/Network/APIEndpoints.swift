//
//  APIEndpoints.swift
//  NewFeed
//
//  Created by Mohd Maruf on 06/05/21.
//

import Foundation

fileprivate let API_KEY = "7d466d3e79fb458b9a1a9a64e72c5fac"

fileprivate var countryCode:String = {
  if let userData = Storage.fetch(from: Constants.Key.USER_DATA) {
    let country = userData["country"] as! [String:String]
    return country.values.first!
  }
  return "us"
}()

struct EndPoints {
  static let baseUrl = "https://newsapi.org/v2/top-headlines"
  static let general = "?country=\(countryCode)&category=general&apiKey=\(API_KEY)"
  static let bussiness = "?country=\(countryCode)&category=business&apiKey=\(API_KEY)"
  static let entertainment = "?country=\(countryCode)&category=entertainment&apiKey=\(API_KEY)"
  static let health = "?country=\(countryCode)&category=health&apiKey=\(API_KEY)"
  static let sports = "?country=\(countryCode)&category=sports&apiKey=\(API_KEY)"
  static let technology = "?country=\(countryCode)&category=technology&apiKey=\(API_KEY)"
}
