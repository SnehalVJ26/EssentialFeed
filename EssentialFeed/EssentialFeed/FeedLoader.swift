//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by mnameit on 09/04/23.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func loadFeed(completion: @escaping (LoadFeedResult) -> Void)
}
