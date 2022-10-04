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
        service.stubHoroscopeResponse = HoroscopeResponse(sign: "aries", text: "hello", date: "today", type: "daily")

        viewModel.getHoroscope {(result: Result<String, ServiceError>) in
            switch result {
            case .success(let success):
                XCTAssertEqual(success, "hello")
            case .failure:
                XCTFail("Should not happen")
            }
        }
    }

    func test_return_error() {
        service.stubError = ServiceError.unknown

        viewModel.getHoroscope {(result: Result<String, ServiceError>) in
            switch result {
            case .success:
                XCTFail("Should not happen")
            case .failure(let failure):
                XCTAssertEqual(failure.localizedDescription, ServiceError.unknown.localizedDescription)
            }
        }
    }
}
