//
//  ArticleRowView.swift
//  NewFeed
//
//  Created by Mohd Maruf on 06/05/21.
//

import SwiftUI

struct ArticleRowView: View {

  var article:Article!
  var color:UIColor = .systemPink
  
    var body: some View {

      VStack(alignment:.leading) {
        VStack{
          Text(article.title).font(.title3)
          HStack {
            Text(article.author ?? "")
            Spacer()
            Text(article.publishedAt.convertToDate())
          }.foregroundColor(.gray).font(.subheadline)
          .padding(.top)
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10.0)
        .padding(10)
      }
      .background(Color(color))
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView()
    }
}
