//
//  OnboardCardViewModelYesterdayTests.swift
//  AsterTests
//
//  Created by Alexandre Graverol on 28/09/2022.
//

import XCTest
import AsterCore
@testable import Aster

class OnboardCardViewModelYesterdayTests: XCTestCase {

    let service = StubHoroscopeService()
    let store = UserStore.instance
    let testUser = User(pseudo: "James", astrologicalSign: "aries", cards: [])

    var viewModel: OnboardCardViewModelYesterday!

    override func setUp() {
        viewModel = OnboardCardViewModelYesterday(service: service)

        store.deleteAllUsers()
        store.persist(user: testUser)
        store.getPersistedUsers()
    }

    func test_get_horoscope_for_user() {
        service.stubHoroscopeResponse = HoroscopeResponse(sign: "aries", text: "Hello", date: "today", type: "daily")

        viewModel.getHorosocpe()

        XCTAssertNotNil(viewModel.horoscopeOfYesterday)
        XCTAssertEqual(viewModel.horoscopeOfYesterday, "The Sun is looking down on you.")
    }

    func test_get_horsocope_return_error() {
        service.stubError = ServiceError.unknown

        viewModel.service.getHoroscope(for: "aries", for: "yesterday") { (result: Result<HoroscopeResponse?, ServiceError>) in
            switch result {
            case .success:
                XCTFail("Should not happen")
            case .failure(let failure):
                XCTAssertEqual(failure.localizedDescription, ServiceError.unknown.localizedDescription)
            }
        }
    }
}
