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

    @IBOutlet weak private var videoListView: UITableView!
    private let dataStore = VideoListDataStore()
    private var videoList: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        deselectRow()
    }


    private func setup() {
        videoListView.register(VideoListViewCell.nib(), forCellReuseIdentifier: VideoListViewCell.identifier)
        videoListView.tableFooterView = UIView()
        videoListView.dataSource = self
        videoListView.delegate = self
        dataStore.delegate = self
        // データソースのリクエスト
        dataStore.request()
    }

    private func deselectRow() {
        if let indexPathForSelectedRow = videoListView.indexPathForSelectedRow {
            videoListView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }

}

extension VideoListViewController: VideoListDataStoreDelegate {
    func dataStore(didReceiveResponse response: VideoListRequest.Response) {
        videoList = response.items
        DispatchQueue.main.async { [weak self] in
            self?.videoListView.reloadData()
        }
    }

    func dataStore(didReceiveError error: Error) {
        let alert = UIAlertController(title: "データ取得失敗", message: error.localizedDescription, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .default)
        alert.addAction(close)
        present(alert, animated: true)
    }
}

extension VideoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoListViewCell.identifier, for: indexPath) as? VideoListViewCell else {
            fatalError()
        }
        cell.setup(video: videoList[indexPath.row])
        return cell
    }
}

extension VideoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let playVideoVC = PlayVideoViewController.make() {
            present(playVideoVC, animated: true)
        } else {
            deselectRow()
        }
    }
}
