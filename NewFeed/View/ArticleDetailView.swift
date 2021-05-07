//
//  ArticleDetailView.swift
//  NewFeed
//
//  Created by Mohd Maruf on 06/05/21.
//

import SwiftUI

struct ArticleDetailView: View {

  var article:Article!

    var body: some View {
      VStack{
        if article.urlToImage != nil {
          URLImage(url:article.urlToImage!)
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.25).padding(.top)
        }
        VStack(alignment:.leading) {
          Text(article.title).font(.title2).bold().padding(.top)
          Text(article.description ?? "").font(.headline).foregroundColor(Color(UIColor.darkGray)).padding(.top)
          HStack {
            Text(article.author ?? "")
            Spacer()
            Text(article.publishedAt.convertToDate())
          }.foregroundColor(Color(UIColor.lightGray)).font(.subheadline)
          .padding([.top])
        }.padding(.horizontal)
        Spacer()
      }

    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView()
    }
}
