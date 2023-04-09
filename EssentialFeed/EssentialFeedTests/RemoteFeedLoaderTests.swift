//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by mnameit on 10/04/23.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}
class HTTPClient {
    static var shared = HTTPClient()
    func get(from url:URL) {
    }
}

class HTTPClientSpy: HTTPClient {
    override func get(from url:URL) {
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
        _ = RemoteFeedLoader()
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_dataFromURL() {
        let sut = RemoteFeedLoader()
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        sut.load()
        XCTAssertNotNil(client.requestURL)
    }

}



