//
//  OnboardCardViewModelTodayTests.swift
//  AsterTests
//
//  Created by Alexandre Graverol on 28/09/2022.
//

import XCTest
import AsterCore
@testable import Aster

class OnboardCardViewModelTodayTests: XCTestCase {

    let service = StubHoroscopeService()
    let store = UserStore.instance
    let testUser = User(pseudo: "James", astrologicalSign: "aries", cards: [])

    var viewModel: OnboardCardViewModelToday!

    override func setUp() {
        viewModel = OnboardCardViewModelToday(service: service)

        store.deleteAllUsers()
        store.persist(user: testUser)
        store.getPersistedUsers()
    }

    func test_get_horoscope_for_user() {
        service.stubHoroscopeResponse = HoroscopeResponse(sign: "aries", text: "Hello", date: "today", type: "daily")

        viewModel.getHoroscope()

        XCTAssertNotNil(viewModel.horoscopeOfTheDay)
        XCTAssertEqual(viewModel.horoscopeOfTheDay, "Follow the stars, they're never wrong.")
    }

    func test_get_horsocope_return_error() {
        service.stubError = ServiceError.unknown

        viewModel.getHoroscope()

        XCTAssertEqual(self.viewModel.horoscopeOfTheDay, "Follow the stars, they're never wrong.")
    }
}
