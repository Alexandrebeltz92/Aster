//
//  AstrologicalSignsTests.swift
//  AsterCoreTests
//
//  Created by Alexandre Graverol on 04/10/2022.
//

import XCTest
@testable import AsterCore

class AstrologicalSignsTests: XCTestCase {

    func test_Should_Return_Capricorn() {
        let sign = AstrologicalSigns.sign(for: 1, day: 1)

        XCTAssertEqual(sign, .capricorn)
    }

    func test_Should_Return_Leo() {
        let sign = AstrologicalSigns.sign(for: 07, day: 23)

        XCTAssertEqual(sign, .leo)
    }

    func test_Should_Return_Leo_When_End_Of_Range() {
        let sign = AstrologicalSigns.sign(for: 8, day: 21)

        XCTAssertEqual(sign, .leo)
    }

    func test_Should_Return_Aries() {
        let sign = AstrologicalSigns.sign(for: 03, day: 23)

        XCTAssertEqual(sign, .aries)
    }
}
