//
//  MockURLProtocol.swift
//  AsterCoreTests
//
//  Created by Alexandre Graverol on 12/09/2022.
//

import Foundation

class MockURLProtocol: URLProtocol {

    override class func canInit(with request: URLRequest) -> Bool {
        true
    }

    static var mockData: Data?
    static var mockStatusCode: Int?

    override func startLoading() {
        let httpURLResponse = HTTPURLResponse(url: URL(string: "https://www.google.com")!, statusCode: Self.mockStatusCode ?? 200, httpVersion: nil, headerFields: nil)

        client?.urlProtocol(self, didReceive: httpURLResponse!, cacheStoragePolicy: .notAllowed)

        if let mockData = Self.mockData {
            client?.urlProtocol(self, didLoad: mockData)
        }

        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {

    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
}
