//
//  CoreDataPersistenceCardTests.swift
//  AsterCoreTests
//
//  Created by Alexandre Graverol on 03/10/2022.
//

import XCTest
import CoreData
@testable import AsterCore

class CoreDataPersistenceCardTests: XCTestCase {

    let testUser = User(pseudo: "Antoine",
                         astrologicalSign: "Leo",
                         cards: [])

    let testCard = Card(name: "The Magicien", imageName: "1_The_Magicien", description: "", saved: false)
    let testCard2 = Card(name: "The High Priestess", imageName: "2_The_High_Priestess", description: "", saved: false)

    var coreDataPersistence: CoreDataPersistence!
    var coreDataPersistenceCard: CoreDataPersistenceCard!
    var coreDataStack: CoreDataStack!

    override func setUp() {
        super.setUp()
        coreDataStack = TestCoreDataStack()
        coreDataPersistence = CoreDataPersistence(coreDataStack: coreDataStack)
        coreDataPersistenceCard = CoreDataPersistenceCard(coreDataStack: coreDataStack)

        coreDataPersistenceCard.deleteAllCardsAndUsers()
    }

    override func tearDown() {
        super.tearDown()

        coreDataPersistenceCard.deleteAllCardsAndUsers()

        coreDataStack = nil
        coreDataPersistenceCard = nil
    }

    func test_get_cards() {
        coreDataPersistence.persist(user: testUser)

        let cards = coreDataPersistenceCard.getCards(for: testUser)

        XCTAssertNotNil(cards)
        XCTAssertTrue(cards.count == 0)
    }

    func test_add_card() {
        coreDataPersistence.persist(user: testUser)

        coreDataPersistenceCard.persist(card: testCard, user: testUser)

        XCTAssertTrue(testUser.cards.count == 1)
        XCTAssertEqual(testUser.cards.contains(where: { $0.name == "The Magicien"}), true)
    }

    func test_delete_card() {
        coreDataPersistence.persist(user: testUser)

        coreDataPersistenceCard.persist(card: testCard, user: testUser)

        XCTAssertTrue(testUser.cards.count == 1)

        coreDataPersistenceCard.delete(card: testCard, user: testUser)

        XCTAssertTrue(testUser.cards.count == 0)
    }

    func test_update_user_cards() {
        coreDataPersistence.persist(user: testUser)
        coreDataPersistenceCard.persist(card: testCard, user: testUser)
        coreDataPersistenceCard.persist(card: testCard2, user: testUser)

        coreDataPersistenceCard.update(card: testCard2, for: testUser)
        let cards = coreDataPersistenceCard.getCards(for: testUser)

        XCTAssertNotNil(cards)
        XCTAssertTrue(testUser.cards.count == 2)
    }
}
