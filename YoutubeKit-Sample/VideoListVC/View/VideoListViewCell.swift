//
//  VideoListViewCell.swift
//  YoutubeKit-Sample
//
//  Created by kawaharadai on 2019/03/30.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit
import YoutubeKit

final class VideoListViewCell: UITableViewCell {

    @IBOutlet weak private var videoImageView: UIImageView!
    @IBOutlet weak private var videoTitleLabel: UILabel!

    static var identifier: String {
        return String(describing: self)
    }

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: .main)
    }

    override func prepareForReuse() {
        videoImageView.image = nil
    }

    func setup(video: Video) {
        videoImageView.setImageAsync(urlString: video.snippet?.thumbnails.high.url)
        videoTitleLabel.text = video.snippet?.title
    }
    
}

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
