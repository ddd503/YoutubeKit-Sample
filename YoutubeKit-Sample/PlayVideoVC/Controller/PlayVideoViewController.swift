//
//  PlayVideoViewController.swift
//  YoutubeKit-Sample
//
//  Created by kawaharadai on 2019/03/30.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit

final class PlayVideoViewController: UIViewController {

    class func make() -> PlayVideoViewController? {
        let storyBoard = UIStoryboard(name: String(describing: PlayVideoViewController.self), bundle: .main)
        let vc = storyBoard.instantiateInitialViewController() as? PlayVideoViewController
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
