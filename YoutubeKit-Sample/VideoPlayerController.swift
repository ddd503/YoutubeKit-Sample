//
//  VideoPlayerController.swift
//  YoutubeKit-Sample
//
//  Created by kawaharadai on 2019/03/28.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit
import YoutubeKit

final class VideoPlayerController: UIViewController {

    private var player: YTSwiftyPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a new player
        player = YTSwiftyPlayer(
            frame: CGRect(x: 0, y: 0, width: 640, height: 480),
            playerVars: [.videoID("videoID-abcde")])

        // Enable auto playback when video is loaded
        player.autoplay = true

        // Set player view.
        view = player

        // Set delegate for detect callback information from the player.
        player.delegate = self

        // Load the video.
        player.loadPlayer()
    }

}

extension VideoPlayerController: YTSwiftyPlayerDelegate {}
