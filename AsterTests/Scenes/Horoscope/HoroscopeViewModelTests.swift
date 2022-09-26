//
//  HoroscopeViewModelTests.swift
//  AsterTests
//
//  Created by Alexandre Graverol on 26/09/2022.
//

import XCTest
import AsterCore
@testable import Aster

class HoroscopeViewModelTests: XCTestCase {

}

class OnboardCardViewModelTodayTests: XCTestCase {

    let service = StubHoroscopeService()
    let store = UserStore.instance
    let testUser = User(pseudo: "James", astrologicalSign: "aries", cards: [])
    let viewModel = OnboardCardViewModelToday()

    override func setUp() {
        store.deleteAllUsers()
        store.persist(user: testUser)
        store.getPersistedUsers()
    }

    // TODO: need to fix this
    func test_get_horoscope_for_user() {
//        service.stubHoroscopeResponse = HoroscopeResponse()

        viewModel.getHoroscope()
    }
}
