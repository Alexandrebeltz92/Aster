//
//  HoroscopeService.swift
//  Aster
//
//  Created by Alexandre Graverol on 17/08/2022.
//

import Foundation

// MARK: - Protocol

protocol Transferable {

    associatedtype GenericType

    func toGenericModel() -> GenericType
}

// MARK: - Class

class HoroscopeService {

    // MARK: - Constants

    static let apiURL = "https://any.ge/horoscope/api/?"

    // MARK: - Properties
    typealias TypeToDeserialize = HoroscopeResponse

    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    // MARK: - Functions
    func getHoroscope(for sign: String, for day: String, completionHandler: @escaping (Result<HoroscopeResponse?, ServiceError>) -> Void) {
        let serviceURL = "\(Self.apiURL)sign=\(sign)&type=daily&day=\(day)&lang=en"

        guard let url = URL(string: serviceURL) else {
            completionHandler(.failure(.invalidURL))
            return
        }

        networkService.get(url: url) {(result: Result<[HoroscopeResponse], ServiceError>) in
            switch result {
            case .success(let model):
                completionHandler(.success(model.first))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
