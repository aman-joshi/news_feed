//
//  ImageLoader.swift
//  NewFeed
//
//  Created by Mohd Maruf on 07/05/21.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {

    @Published var downloadedImage: UIImage?

    func load(url: String) {

        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct!")
        }

        URLSession.shared.dataTask(with: imageURL) { data, response, error in

            guard let data = data, error == nil else {
                return
            }


            DispatchQueue.main.async {
              self.downloadedImage = UIImage(data: data)
            }

        }.resume()

    }


}
