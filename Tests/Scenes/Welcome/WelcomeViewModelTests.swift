//
//  WelcomeViewModelTests.swift
//  AsterTests
//
//  Created by Alexandre Graverol on 23/09/2022.
//

import XCTest
import AsterCore
@testable import Aster

class WelcomeViewModelTests: XCTestCase {

    let store = UserStore.instance
    let viewModel = WelcomeViewModel()
    let userTest = User(pseudo: "Alex", astrologicalSign: "", cards: [])

    override func setUp() {
        store.deleteAllUsers()
        store.persist(user: userTest)
    }

    override func tearDown() {
        store.deleteAllUsers()
    }

    func test_if_user_is_saved() {
        store.getPersistedUsers()

        let response = viewModel.haveUserSaved()

        XCTAssertTrue(response)
    }

    func test_if_user_isnt_saved() {
        store.deleteAllUsers()

        store.getPersistedUsers()

        let response = viewModel.haveUserSaved()

        XCTAssertFalse(response)
    }
}
