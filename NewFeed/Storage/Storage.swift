//
//  Storage.swift
//  NewFeed
//
//  Created by Mohd Maruf on 05/05/21.
//

import Foundation

typealias JSON = [String:Any]

final class Storage {
  private static let userDefault = UserDefaults.standard

  private init() {}

  static func store(json:JSON,key:String) {
    userDefault.setValue(json, forKey: key)
    userDefault.synchronize()
  }

  static func fetch(from key:String) -> JSON? {
    guard let response = userDefault.object(forKey: key) as? JSON else { return nil}
    return response
  }
}
