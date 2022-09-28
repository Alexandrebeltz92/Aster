//
//  NetworkServiceTests.swift
//  AsterCoreTests
//
//  Created by Alexandre Graverol on 12/09/2022.
//

@testable import AsterCore
import XCTest

class NetworkServiceTests: XCTestCase {

    func test_GivenStatusCodeBetween200And300_WhenCallinService_ShouldReturnData() {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]

        MockURLProtocol.mockData = json(with: "horoscope_response")!.data(using: .utf8)!

        let customURLSession = URLSession(configuration: configuration)

        let networkService = NetworkService(urlSession: customURLSession)

        networkService.get(url: URL(string: "https://www.google.com")!) { (result: Result<HoroscopeResponse, ServiceError>) in
            switch result {
            case .success(let success):
                XCTAssertEqual(success.sign, "taurus")
            case .failure:
                XCTFail("Should have return success")
            }
        }
    }

    func test_GivenStatusCodeBetween300And400_WhenCallinService_ShouldReturnError() {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]

        MockURLProtocol.mockData = json(with: "horoscope_response")!.data(using: .utf8)!
        MockURLProtocol.mockStatusCode = 301

        let customURLSession = URLSession(configuration: configuration)

        let networkService = NetworkService(urlSession: customURLSession)

        networkService.get(url: URL(string: "https://www.google.com")!) { (result: Result<HoroscopeResponse, ServiceError>) in
            switch result {
            case .success:
                XCTFail("Should have return error")
            case .failure(let error):
                XCTAssertEqual(error.errorDescription, ServiceError.redirection.errorDescription)
            }
        }
    }

    func test_GivenStatusCodeBetween400And500_WhenCallinService_ShouldReturnError() {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]

        MockURLProtocol.mockData = json(with: "horoscope_response")!.data(using: .utf8)!
        MockURLProtocol.mockStatusCode = 401

        let customURLSession = URLSession(configuration: configuration)

        let networkService = NetworkService(urlSession: customURLSession)

        networkService.get(url: URL(string: "https://www.google.com")!) { (result: Result<HoroscopeResponse, ServiceError>) in
            switch result {
            case .success:
                XCTFail("Should have return error")
            case .failure(let error):
                XCTAssertEqual(error.errorDescription, ServiceError.httpClientError.errorDescription)
            }
        }
    }

    func test_GivenStatusCodeBetween500And600_WhenCallinService_ShouldReturnError() {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]

        MockURLProtocol.mockData = json(with: "horoscope_response")!.data(using: .utf8)!
        MockURLProtocol.mockStatusCode =  501

        let customURLSession = URLSession(configuration: configuration)

        let networkService = NetworkService(urlSession: customURLSession)

        networkService.get(url: URL(string: "https://www.google.com")!) { (result: Result<HoroscopeResponse, ServiceError>) in
            switch result {
            case .success:
                XCTFail("Should have return error")
            case .failure(let error):
                XCTAssertEqual(error.errorDescription, ServiceError.serverError.errorDescription)
            }
        }
    }
}
