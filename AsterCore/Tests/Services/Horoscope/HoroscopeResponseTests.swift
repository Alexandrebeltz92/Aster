//
//  HoroscopeResponseTests.swift
//  AsterCoreTests
//
//  Created by Alexandre Graverol on 12/09/2022.
//

import XCTest
@testable import AsterCore

class HoroscopeResponseTests: XCTestCase {

    func test_GivenJSON_WhenTryinToDecode_ShouldInstantiate() {
        let rawData = json(with: "horoscope_response")!

        do {
            let response = try JSONDecoder().decode(HoroscopeResponse.self, from: rawData.data(using: .utf8)!)

            XCTAssertNotNil(response)
        } catch {
            XCTFail("Should have been not nil")
        }
    }

    func test_GivenBrokenJSON_WhenTryinToDecode_ShouldNotInstantiate() {
        let rawData = json(with: "broken_horoscope_response")!

        XCTAssertThrowsError(try JSONDecoder().decode(HoroscopeResponse.self, from: rawData.data(using: .utf8)!))
    }

    func test_GivenJSON_WhenDecode_ShouldReturnSign() {
        let rawData = json(with: "horoscope_response")!

        do {
            let response = try JSONDecoder().decode(HoroscopeResponse.self, from: rawData.data(using: .utf8)!)
            XCTAssertEqual(response.sign, "taurus")
        } catch {
            XCTFail("Should have been not nil")
        }
    }
}
