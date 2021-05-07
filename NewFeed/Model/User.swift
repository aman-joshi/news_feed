//
//  UserModel.swift
//  NewFeed
//
//  Created by Mohd Maruf on 05/05/21.
//

import Foundation

class User:ObservableObject {
  var id:String
  var name:String
  var country:String

  init(id:String,name:String,country:String) {
    self.id = id
    self.name = name
    self.country = country
  }

  
}
