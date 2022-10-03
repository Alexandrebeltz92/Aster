//
//  TarotCardViewModelTests.swift
//  AsterTests
//
//  Created by Alexandre Graverol on 26/09/2022.
//

import XCTest
import AsterCore
@testable import Aster

class TarotCardViewModelTests: XCTestCase {

    func testInitialization() {
        // Initialize Tarot Card Detail View Model
        let tarotCardViewModel = TarotCardViewModel()

        XCTAssertNotNil(tarotCardViewModel, "The tarot card detail view model should not be nil.")
    }

    func test_generate_card() {
        let card = TarotCardViewModel().cardToShow
        XCTAssertNotNil(card)

        TarotCardViewModel().refreshCard()

        XCTAssertNotEqual(card.name, TarotCardViewModel().cardToShow.name)
    }
}
