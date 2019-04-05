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

    @IBOutlet weak var playerView: UIView!

    private var videoId = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPlayer()
    }

    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    private func setupVideoPlayer() {
        let videoPlayer = YTSwiftyPlayer(frame: CGRect(x: 0,
                                                       y: 0,
                                                       width: playerView.bounds.size.width,
                                                       height: playerView.bounds.size.height),
                                         playerVars: [.videoID(videoId)])
        // Enable auto playback when video is loaded
        videoPlayer.autoplay = true

        // Set player view.
        playerView.addSubview(videoPlayer)

        // Set delegate for detect callback information from the player.
        videoPlayer.delegate = self

        // Load the video.
        videoPlayer.loadPlayer()
    }
    
}

extension PlayVideoViewController: YTSwiftyPlayerDelegate {
    func player(_ player: YTSwiftyPlayer, didChangeState state: YTSwiftyPlayerState) {
        print(state)
        switch state {
        case .cued:
            self.dismiss(animated: true)
        default: break
        }
    }

    func player(_ player: YTSwiftyPlayer, didReceiveError error: YTSwiftyPlayerError) {
        print(error)
    }

    func youtubeIframeAPIFailedToLoad(_ player: YTSwiftyPlayer) {
        print("失敗")
    }
}
