//
//  MainView.swift
//  NewFeed
//
//  Created by Mohd Maruf on 06/05/21.
//

import SwiftUI

struct MainView: View {

  @EnvironmentObject var menuViewModel:MenuViewModel

  var body: some View {
    GeometryReader(content: { geometry in
      if menuViewModel.newsModel != nil {
        List(menuViewModel.newsModel!.articles,id: \.self) { article in
          NavigationLink(destination: ArticleDetailView(article: article)) {
            ArticleRowView(article: article,color: menuViewModel.categorySelected.color())

          }
        }.listStyle(InsetListStyle())
        .lineSpacing(2.0)
      }
      })
    .onAppear(perform: {
      UITableView.appearance().backgroundColor = .clear
      UITableView.appearance().separatorStyle = .none
      if !menuViewModel.isLoaded {
        menuViewModel.loadData()
        menuViewModel.isLoaded = true
      }
    })
  }

}
