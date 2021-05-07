//
//  Extensions.swift
//  NewFeed
//
//  Created by Mohd Maruf on 07/05/21.
//

import Foundation

extension String {

  func convertToDate() -> Self {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
    let date = dateFormatter.date(from: self)
    return convertToString(from: date!)
  }

  private func convertToString(from date:Date) -> Self {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.timeStyle = .short
    return dateFormatter.string(from: date)
  }


}
