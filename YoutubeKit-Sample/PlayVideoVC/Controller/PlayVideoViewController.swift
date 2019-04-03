//
//  PlayVideoViewController.swift
//  YoutubeKit-Sample
//
//  Created by kawaharadai on 2019/03/30.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit
import YoutubeKit

final class PlayVideoViewController: UIViewController {

     class func make(videoId: String) -> PlayVideoViewController? {
        let storyBoard = UIStoryboard(name: String(describing: PlayVideoViewController.self), bundle: .main)
        let vc = storyBoard.instantiateInitialViewController() as? PlayVideoViewController
        vc?.videoId = videoId
        return vc
    }

    private var videoId = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPlayer()
    }

    private func setupVideoPlayer() {
        let videoPlayer = YTSwiftyPlayer(frame: CGRect(x: 0,
                                                       y: 0,
                                                       width: self.view.bounds.size.width,
                                                       height: self.view.bounds.size.height),
                                         playerVars: [.videoID(videoId)])
        // Enable auto playback when video is loaded
        videoPlayer.autoplay = true

        // Set player view.
        view = videoPlayer

        // Set delegate for detect callback information from the player.
        videoPlayer.delegate = self

        // Load the video.
        videoPlayer.loadPlayer()
    }
    
}

extension PlayVideoViewController: YTSwiftyPlayerDelegate {}
