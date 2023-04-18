//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by mnameit on 10/04/23.
//

import Foundation


public protocol HTTPClient {
    func get(from url:URL, completion: @escaping (Error) -> Void)
}

public final class RemoteFeedLoader {
    private var url: URL
    private var client: HTTPClient
    public enum Error: Swift.Error {
        case connectivity
    }
    public init(client: HTTPClient, url: URL = URL(string: "https://a-url.com")!) {
        self.client = client
        self.url = url
    }
    public func load(completion: @escaping (Error) -> Void = { _ in }) {
        client.get(from: url) { error in
            completion(.connectivity)
        }
    }
}
