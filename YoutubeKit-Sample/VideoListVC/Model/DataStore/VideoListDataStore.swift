//
//  VideoListDataStore.swift
//  YoutubeKit-Sample
//
//  Created by kawaharadai on 2019/03/30.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import YoutubeKit

protocol VideoListDataStoreDelegate: class {
    func dataStore(didReceiveResponse response: VideoListRequest.Response)
    func dataStore(didReceiveError error: Error)
}

final class VideoListDataStore {

    weak var delegate: VideoListDataStoreDelegate?

    func request() {
        // Get youtube chart ranking
        let request = VideoListRequest(part: [.id, .snippet, .contentDetails, .status, .statistics],
                                       filter: .chart,
                                       maxResults: 10)

        // Send a request.
        ApiSession.shared.send(request) { [weak self] result in
            switch result {
            case .success(let response):
                self?.delegate?.dataStore(didReceiveResponse: response)
            case .failed(let error):
                self?.delegate?.dataStore(didReceiveError: error)
            }
        }
    }

}

