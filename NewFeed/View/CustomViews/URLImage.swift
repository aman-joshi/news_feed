//
//  URLImage.swift
//  NewFeed
//
//  Created by Mohd Maruf on 07/05/21.
//

import SwiftUI

struct URLImage: View {
  @ObservedObject private var imageLoader = ImageLoader()

  var placeholder: Image

  init(url: String, placeholder: Image = Image(systemName: "photo")) {
    self.placeholder = placeholder
    self.imageLoader.load(url: url)
  }

  var body: some View {
    if let uiImage = self.imageLoader.downloadedImage {
      return Image(uiImage: uiImage).resizable()
    } else {
      return placeholder.resizable()
    }
  }
}

