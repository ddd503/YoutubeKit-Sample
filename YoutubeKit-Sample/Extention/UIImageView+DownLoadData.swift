//
//  UIImageView+DownLoadData.swift
//  YoutubeKit-Sample
//
//  Created by kawaharadai on 2019/04/03.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImageAsync(urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            DispatchQueue.main.async { [weak self] in
                self?.image = UIImage(named: "no_image")!
            }
            return
        }

        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad

        let session = URLSession(configuration: config)

        session.dataTask(with: url) { [weak self] (data, response, error) in
            var image: UIImage

            if let error = error {
                print(error.localizedDescription)
                image = UIImage(named: "no_image")!
            } else if let data = data, let downLoadImage = UIImage(data: data) {
                image = downLoadImage
            } else {
                image = UIImage(named: "no_image")!
            }

            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
            }.resume()
    }
}

