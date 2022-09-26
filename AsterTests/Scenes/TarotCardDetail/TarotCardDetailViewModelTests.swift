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
//    let userTest = User(pseudo: "Alex", astrologicalSign: "", cards: [])

    override func setUp() {
        let userTest = User(pseudo: "Alex", astrologicalSign: "", cards: [card])
        store.persist(user: userTest)
    }

    override func tearDown() {
        store.deleteAllUsers()
    }

    func testInitialization() {
        // Initialize Tarot Card Detail View Model
        let tarotCardDetailViewModel = TarotCardDetailViewModel(card: card)

        XCTAssertNotNil(tarotCardDetailViewModel, "The tarot card detail view model should not be nil.")
        XCTAssertTrue(tarotCardDetailViewModel.card.name == card.name)
    }

    func test_saving_card() {
        store.getPersistedUsers()

        guard let currentUser = store.users.first else {
            fatalError()
        }

        currentUser.cards.append(card)
        store.update(user: currentUser)

//        XCTAssertEqual(currentUser?.cards.count, 1)
    }

    func test_check_if_card_is_saved() {
        store.getPersistedUsers()

        let currentUserCards = store.users.first?.cards

        if let response = currentUserCards?.contains(where: { $0.name == card.name }) {
//            XCTAssertTrue(response)
        }
    }
}
