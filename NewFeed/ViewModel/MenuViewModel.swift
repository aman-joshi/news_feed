//
//  MenuViewModel.swift
//  NewFeed
//
//  Created by Mohd Maruf on 05/05/21.
//

import Foundation

class MenuViewModel: ObservableObject {

  @Published var categorySelected:Category = Category.general
  @Published var newsModel:NewsModel?
  @Published var showMenu = true
  @Published var showAlert = false
  @Published var showLoader = true

  var isLoaded = false
  var error:Error? = nil

  func loadData() {
    self.showLoader = true
    ApiManager.shared.fetchNews(from: categorySelected.endpoints()) { (newsModel, error) in
      self.showLoader = false
      if newsModel != nil {
        self.newsModel = newsModel
      }else{
        self.error = error
      }
    }
  }

}
