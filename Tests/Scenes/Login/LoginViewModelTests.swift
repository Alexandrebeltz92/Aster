//
//  LoginViewModelTests.swift
//  AsterTests
//
//  Created by Alexandre Graverol on 26/09/2022.
//

import XCTest
import AsterCore
@testable import Aster

class LoginViewModelTests: XCTestCase {

    let store = UserStore.instance
    let viewModel = LoginViewModel()

    override class func setUp() {
        UserStore.instance.deleteAllUsers()
    }

    override class func tearDown() {
        UserStore.instance.deleteAllUsers()
    }

    func test_save() {
        viewModel.pseudo = "James"
        viewModel.monthOfBirth = "12"
        viewModel.dayOfBirth = "05"

        viewModel.save()

        store.getPersistedUsers()

        XCTAssertNotNil(store.users)
        XCTAssertTrue(!store.users.isEmpty)
    }
}
