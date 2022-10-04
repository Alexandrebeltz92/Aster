//
//  StubNetworkService.swift
//  AsterCoreTests
//
//  Created by Alexandre Graverol on 12/09/2022.
//

import Foundation
@testable import AsterCore

class StubNetworkService: NetworkServiceProtocol {

    var stubData: Decodable?
    var stubError: ServiceError?

    func get<T>(url: URL, completionHandler: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable {
        if let stubError = stubError {
            completionHandler(.failure(stubError))
        } else if let stubData = stubData, let castedMockData = stubData as? T {
            completionHandler(.success(castedMockData))
        }
    }

    func post<T>(url: URL, completionHandler: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable {
        if let stubError = stubError {
            completionHandler(.failure(stubError))
        } else if let stubData = stubData, let castedMockData = stubData as? T {
            completionHandler(.success(castedMockData))
        }
    }

    func call<T>(request: URLRequest, completionHandler: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable {
        if let stubError = stubError {
            completionHandler(.failure(stubError))
        } else if let stubData = stubData, let castedMockData = stubData as? T {
            completionHandler(.success(castedMockData))
        }
    }
}
