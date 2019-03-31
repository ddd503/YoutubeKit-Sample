//
//  VideoListViewController.swift
//  YoutubeKit-Sample
//
//  Created by kawaharadai on 2019/03/30.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit
import YoutubeKit

final class VideoListViewController: UIViewController {

    private let dataStore = VideoInfoDataStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataStore.delegate = self
        dataStore.request()
    }

}

extension VideoListViewController: VideoInfoDataStoreDelegate {
    func dataStore(didReceiveResponse response: VideoListRequest.Response) {
        print(response.items.count)
    }

    func dataStore(didReceiveError error: Error) {
        print(error.localizedDescription)
    }
}
