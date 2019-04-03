//
//  PlayVideoViewController.swift
//  YoutubeKit-Sample
//
//  Created by kawaharadai on 2019/03/30.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit

final class PlayVideoViewController: UIViewController {

     class func make(videoId: String) -> PlayVideoViewController? {
        let storyBoard = UIStoryboard(name: String(describing: PlayVideoViewController.self), bundle: .main)
        let vc = storyBoard.instantiateInitialViewController() as? PlayVideoViewController
        vc?.videoId = videoId
        return vc
    }

    var videoId = ""

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
