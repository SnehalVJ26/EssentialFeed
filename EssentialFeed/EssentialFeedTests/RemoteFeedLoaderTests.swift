//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by mnameit on 10/04/23.
//

import XCTest

class RemoteFeedLoader {
    
}
class HTTPClient {
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
        let sut = RemoteFeedLoader()
        let client = HTTPClient()
        XCTAssertNil(client.requestURL)
    }

}



