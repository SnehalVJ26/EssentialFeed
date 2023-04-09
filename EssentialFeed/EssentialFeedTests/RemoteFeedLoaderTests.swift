//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by mnameit on 10/04/23.
//

import XCTest

class RemoteFeedLoader {
    var client: HTTPClient
    var url: URL
    init(client: HTTPClient, url: URL = URL(string: "https://a-url.com")!) {
        self.client = client
        self.url = url
    }
    func load() {
        client.get(from: url)
    }
}
protocol HTTPClient {
    func get(from url:URL)
}



final class RemoteFeedLoaderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_dataFromURL() {
        let (sut, client) = makeSUT()
        sut.load()
        XCTAssertNotNil(client.requestURL)
    }

    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut =  RemoteFeedLoader(client: client, url: url)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestURL: URL?

        func get(from url:URL) {
            requestURL = url
        }
    }
}



