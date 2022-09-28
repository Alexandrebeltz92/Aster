//
//  ProfilViewModelTests.swift
//  AsterTests
//
//  Created by Alexandre Graverol on 26/09/2022.
//

import XCTest
import AsterCore
@testable import Aster

class ProfilViewModelTests: XCTestCase {

    let viewModel = ProfilViewModel()
    let store = UserStore.instance

    override class func setUp() {
        let user = User(pseudo: "James", astrologicalSign: "aries", cards: [])
        UserStore.instance.persist(user: user)
        UserStore.instance.getPersistedUsers()
    }

    override class func tearDown() {
        UserStore.instance.getPersistedUsers()
        UserStore.instance.deleteAllUsers()
    }

    func test_initialization() {
        // Initialize Tarot Card Detail View Model
        let viewModel = ProfilViewModel()

        XCTAssertNotNil(viewModel, "The profil view model should not be nil.")
    }

    func test_refresh_user() {
        store.getPersistedUsers()
        let user = viewModel.userToDisplay
        XCTAssertNotNil(user)

        viewModel.refreshUser()
        XCTAssertEqual(user.pseudo, viewModel.userToDisplay.pseudo)
    }
}
