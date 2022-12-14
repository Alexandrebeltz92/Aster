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
        let birthdate = DateComponents(year: 2000, month: 01, day: 01)
        guard let date = Calendar.current.date(from: birthdate) else {
            return
        }

        viewModel.pseudo = "James"
        viewModel.birthday = date
        viewModel.save()

        store.getPersistedUsers()

        XCTAssertNotNil(store.users)
        XCTAssertTrue(!store.users.isEmpty)
    }
}
