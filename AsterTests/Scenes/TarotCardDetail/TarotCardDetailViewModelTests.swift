//
//  TarotCardDetailViewModelTests.swift
//  AsterTests
//
//  Created by Alexandre Graverol on 25/09/2022.
//

import XCTest
import AsterCore
@testable import Aster

class TarotCardDetailViewModelTests: XCTestCase {
    let store = UserStore.instance
    let card = Card(name: "0 The Fool", imageName: "0_The_Fool", description: "", saved: false)

    override class func setUp() {
        let user = User(pseudo: "James", astrologicalSign: "aries", cards: [])
        UserStore.instance.persist(user: user)
        UserStore.instance.getPersistedUsers()
    }

    override class func tearDown() {
        UserStore.instance.getPersistedUsers()
        UserStore.instance.deleteAllUsers()
    }

    func testInitialization() {
        // Initialize Tarot Card Detail View Model
        let tarotCardDetailViewModel = TarotCardDetailViewModel(card: card)

        XCTAssertNotNil(tarotCardDetailViewModel, "The tarot card detail view model should not be nil.")
        XCTAssertTrue(tarotCardDetailViewModel.card.name == card.name)
    }

    func test_saving_card() {
        let viewModel = TarotCardDetailViewModel(card: card)
        store.getPersistedUsers()

        guard let currentUser = store.users.first else {
            XCTFail("Should not happen")
            return
        }

        currentUser.cards.append(card)

        viewModel.saveCard()

        XCTAssertEqual(currentUser.cards.count, 1)
    }

    func test_check_if_card_is_saved_when_there_is_no_card() {
        let viewModel = TarotCardDetailViewModel(card: card)
        store.getPersistedUsers()

        let currentUserCards = store.users.first?.cards

        viewModel.checkIfSaved(for: card)

        if let response = currentUserCards?.contains(where: { $0.name == card.name }) {
            XCTAssertFalse(response)

        }
    }
}
