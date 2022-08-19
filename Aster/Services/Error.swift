//
//  Error.swift
//  Aster
//
//  Created by Alexandre Graverol on 17/08/2022.
//

import Foundation

enum ServiceError: Error {
    case unknown
    case invalidURL
    case emptyData
    case failedToDeserialize
    case redirection
    case httpClientError
    case serverError

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown"
        case .invalidURL:
            return "Invalid URL"
        case .emptyData:
            return "Empty Data"
        case .failedToDeserialize:
            return "Failed to deserialize"
        case .redirection:
            return "Redirection"
        case .httpClientError:
            return "http client error"
        case .serverError:
            return "server error"
        }
    }
}
