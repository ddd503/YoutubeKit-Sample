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

    func setup(video: Video) {
        videoTitleLabel.text = video.snippet?.title
    }
    
}
