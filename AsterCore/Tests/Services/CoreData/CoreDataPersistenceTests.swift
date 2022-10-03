//
//  CoreDataPersistenceTests.swift
//  AsterCoreTests
//
//  Created by Alexandre Graverol on 12/09/2022.
//

import XCTest
import CoreData
@testable import AsterCore

class CoreDataPersistenceTests: XCTestCase {

    let testUser = User(pseudo: "James",
                        astrologicalSign: "Aries",
                        cards: [Card(name: "0 The Fool", imageName: "0_The_Fool", description: "", saved: false)])

    let testUser2 = User(pseudo: "Antoine",
                         astrologicalSign: "Leo",
                         cards: [Card(name: "0 The Fool", imageName: "0_The_Fool", description: "", saved: false)])

    let testCard = Card(name: "0 The Fool", imageName: "0_The_Fool", description: "", saved: false)

    var coreDataPersistence: CoreDataPersistence!
    var coreDataStack: CoreDataStack!

    override func setUp() {
        super.setUp()
        coreDataStack = TestCoreDataStack()
        coreDataPersistence = CoreDataPersistence(coreDataStack: coreDataStack)

        coreDataPersistence.deleteAllUsers()
    }

    override func tearDown() {
        super.tearDown()

        coreDataPersistence.deleteAllUsers()

        coreDataStack = nil
        coreDataPersistence = nil
    }

    func test_Get_Users() {
        coreDataPersistence.persist(user: testUser)

        let getUser = coreDataPersistence.getUsers()

        XCTAssertNotNil(getUser)
        XCTAssertTrue(getUser.count == 1)
    }

    func test_Add_Users() {
        coreDataPersistence.persist(user: testUser)
        coreDataPersistence.persist(user: testUser2)

        let getUsers = coreDataPersistence.getUsers()

        XCTAssertTrue(getUsers.count == 2)
        XCTAssertEqual(getUsers.contains(where: { $0.pseudo == "James"}), true)
        XCTAssertEqual(getUsers.contains(where: { $0.pseudo == "Antoine"}), true)
    }

    func test_Delete_User() {
        coreDataPersistence.persist(user: testUser)
        coreDataPersistence.persist(user: testUser2)

        var getUsers = coreDataPersistence.getUsers()

        coreDataPersistence.delete(user: testUser)

        getUsers = coreDataPersistence.getUsers()

        XCTAssertFalse(getUsers.contains(where: { $0.pseudo == "James"}))
        XCTAssertTrue(getUsers.contains(where: { $0.pseudo == "Antoine"}))
        XCTAssertTrue(getUsers.count == 1)
    }

    func test_Add_User_Already_Added() {
        coreDataPersistence.persist(user: testUser)

        let firstGetUsers = coreDataPersistence.getUsers()
        XCTAssertTrue(firstGetUsers.contains(where: { $0.pseudo == "James"}))
        XCTAssertTrue(firstGetUsers.count == 1)

        coreDataPersistence.persist(user: testUser)

        let newGetUsers = coreDataPersistence.getUsers()
        XCTAssertTrue(newGetUsers.count == 1)
    }
}
