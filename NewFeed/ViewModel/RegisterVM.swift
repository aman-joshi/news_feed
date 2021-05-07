//
//  RegisterVM.swift
//  NewFeed
//
//  Created by Mohd Maruf on 05/05/21.
//

import Combine
import Foundation

class RegisterVM: ObservableObject {

  @Published var isRegistered = false
  @Published var user:User!


  func registerUser(by name:String, country:CountryList) {
    let userJson = ["id": UUID().uuidString, "name": name, "country": [country.rawValue:country.countryCode()]] as [String : Any]
    Storage.store(json: userJson, key: Constants.Key.USER_DATA)
    let country = userJson["country"] as! [String:String]
    self.user = User(id: userJson["id"] as! String, name: userJson["name"] as! String, country: country.keys.first!)
    self.isRegistered = true
  }

}
