//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by mnameit on 10/04/23.
//

import Foundation


public protocol HTTPClient {
    func get(from url:URL)
}

public final class RemoteFeedLoader {
    private var url: URL
    private var client: HTTPClient
    public init(client: HTTPClient, url: URL = URL(string: "https://a-url.com")!) {
        self.client = client
        self.url = url
    }
    public func load() {
        client.get(from: url)
    }
}
