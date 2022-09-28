//
//  HoroscopeServiceTests.swift
//  AsterCoreTests
//
//  Created by Alexandre Graverol on 12/09/2022.
//

import XCTest
@testable import AsterCore

class HoroscopeServiceTests: XCTestCase {

    // MARK: - Properties
    var stubNetworkService: StubNetworkService!
    var service: HoroscopeService!

    override func setUp() {
        super.setUp()

        stubNetworkService = StubNetworkService()
        service = HoroscopeService(networkService: stubNetworkService)
    }

    func test_GivenAResponse_WhenGetRecipe_ShouldReturnSameResponse() {
        let response = HoroscopeResponse(sign: "aries", text: "Hello", date: "today", type: "daily")
        stubNetworkService.stubData = response

        service.getHoroscope(for: "aries", for: "today") { (result: Result<HoroscopeResponse?, ServiceError>) in
            switch result {
            case .success(let value):
                XCTAssertEqual(value?.sign, "Aries")
            case .failure:
                NSLog("Should have succeed")
            }
        }
    }

    func test_GivenABrokenResponse_WhenGetRecipe_ShouldReturnError() {
        stubNetworkService.stubError = .unknown

        service.getHoroscope(for: "aries", for: "today") { (result: Result<HoroscopeResponse?, ServiceError>) in
            switch result {
            case .success:
                NSLog("Should have succeed")
            case .failure(let error):
                XCTAssertEqual(error.errorDescription, ServiceError.unknown.errorDescription)
            }
        }
    }
}
