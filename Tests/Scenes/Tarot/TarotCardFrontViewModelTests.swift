//
//  TarotCardFrontViewModelTests.swift
//  AsterTests
//
//  Created by Alexandre Graverol on 26/09/2022.
//

import XCTest
import AsterCore
@testable import Aster

class TarotCardFrontViewModelTests: XCTestCase {

    let card = Card(name: "0 The Fool", imageName: "0_The_Foold", description: "", saved: false)

    func testInitialization() {
        // Initialize View Model
        let viewModel = CardFrontViewModel(tarotCard: card)

        XCTAssertNotNil(viewModel, "The tarot card detail view model should not be nil.")
        XCTAssertEqual(viewModel.tarotCard.name, card.name)
    }
}
