//
//  NetworkService.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation

public protocol NetworkServiceProtocol {
    func post<T>(url: URL, completionHandler: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable
    func get<T>(url: URL, completionHandler: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable
    func call<T>(request: URLRequest, completionHandler: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable
}

public struct NetworkService: NetworkServiceProtocol {

    private let urlSession: URLSession

    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    public func get<T>(url: URL, completionHandler: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable {
        call(request: URLRequest(url: url), completionHandler: completionHandler)
    }

    public func post<T>(url: URL, completionHandler: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        call(request: request, completionHandler: completionHandler)
    }

    public func call<T>(request: URLRequest, completionHandler: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable {
        urlSession
            .dataTask(with: request) { data, response, error in
                if error != nil {
                    dump(error)
                    completionHandler(.failure(.unknown))
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    completionHandler(.failure(.unknown))
                    return
                }

                switch httpResponse.statusCode {
                case 200..<300:
                    guard let data = data else {
                        completionHandler(.failure(.emptyData))
                        return
                    }

                    do {
                        let model = try JSONDecoder().decode(T.self, from: data)
                        completionHandler(.success(model))
                    } catch {
                        dump(error)
                        completionHandler(.failure(.failedToDeserialize))
                    }

                case 300..<400:
                    completionHandler(.failure(.redirection))
                case 400..<500:
                    completionHandler(.failure(.httpClientError))
                case 500..<600:
                    completionHandler(.failure(.serverError))
                default:
                    completionHandler(.failure(.unknown))
                }
            }
            .resume()
    }
}
