//
//  DataStore.swift
//  YoutubeKit-Sample
//
//  Created by kawaharadai on 2019/03/30.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import YoutubeKit

final class DataStore {

    static func request() {
        // Get youtube chart ranking
        let request = VideoListRequest(part: [.id, .statistics], filter: .chart)

        // Send a request.
        ApiSession.shared.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failed(let error):
                print(error)
            }
        }
    }

}
