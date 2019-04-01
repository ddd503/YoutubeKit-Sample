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

    private let dataStore = VideoListDataStore()
    private var videoList: VideoListRequest.Response?

    override func viewDidLoad() {
        super.viewDidLoad()
        dataStore.delegate = self
        dataStore.request()
    }

}

extension VideoListViewController: VideoListDataStoreDelegate {
    func dataStore(didReceiveResponse response: VideoListRequest.Response) {
        videoList = response
    }

    func dataStore(didReceiveError error: Error) {
        let alert = UIAlertController(title: "データ取得失敗", message: error.localizedDescription, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .default)
        alert.addAction(close)
        present(alert, animated: true)
    }
}
