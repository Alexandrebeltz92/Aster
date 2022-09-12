//
//  CoreDataPersistenceTests.swift
//  AsterCoreTests
//
//  Created by Alexandre Graverol on 12/09/2022.
//

import XCTest
@testable import AsterCore
import CoreData

class CoreDataPersistenceTests: XCTestCase {

    let testUser = User(pseudo: "James", dateOfBirth: "2503", astrologicalSign: "Aries", cards: [Card(name: "0_The_Fool")])
    let testUser2 = User(pseudo: "Antoine", dateOfBirth: "1708", astrologicalSign: "Leo", cards: [Card(name: "0_The_Fool")])

    let testCard = Card(name: "0_The_Fool")

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
        XCTAssertTrue(getUsers.contains(testUser))
        XCTAssertTrue(getUsers.contains(testUser2))
    }

    func test_Delete_User() {
        coreDataPersistence.persist(user: testUser)
        coreDataPersistence.persist(user: testUser2)

        var getUsers = coreDataPersistence.getUsers()

        coreDataPersistence.delete(user: testUser)

        getUsers = coreDataPersistence.getUsers()

        XCTAssertFalse(getUsers.contains(testUser))
        XCTAssertTrue(getUsers.contains(testUser2))
        XCTAssertTrue(getUsers.count == 1)
    }

    func test_Add_User_Already_Added() {
        coreDataPersistence.persist(user: testUser)

        let firstGetUsers = coreDataPersistence.getUsers()
        XCTAssertTrue(firstGetUsers.contains(testUser))
        XCTAssertTrue(firstGetUsers.count == 1)

        coreDataPersistence.persist(user: testUser)

        let newGetUsers = coreDataPersistence.getUsers()
        XCTAssertTrue(newGetUsers.count == 1)
    }
}
