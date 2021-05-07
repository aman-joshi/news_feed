//
//  CountryList.swift
//  NewFeed
//
//  Created by Mohd Maruf on 05/05/21.
//

import Foundation

enum CountryList:String,CaseIterable {
  case india      = "India"
  case usa        = "USA"
  case canada     = "Canada"
  case australia  = "Australia"
  case china      = "China"
  case germany    = "Germany"

  func countryCode() -> String {
    switch self {
    case .india:
      return "in"
    case .usa:
      return "us"
    case .canada:
      return "ca"
    case .australia:
      return "au"
    case .china:
      return "ch"
    case .germany:
      return "de"
    }
  }

}
