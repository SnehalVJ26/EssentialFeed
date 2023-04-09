//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by mnameit on 10/04/23.
//

import XCTest

class RemoteFeedLoader {
    var client: HTTPClient
    init(client: HTTPClient) {
        self.client = client
    }
    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
}
protocol HTTPClient {
    func get(from url:URL)
}

class HTTPClientSpy: HTTPClient {
    func get(from url:URL) {
        requestURL = url
    }
    var requestURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_dataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        sut.load()
        XCTAssertNotNil(client.requestURL)
    }

}



