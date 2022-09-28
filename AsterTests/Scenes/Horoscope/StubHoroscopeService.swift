//
//  StubHoroscopeService.swift
//  AsterTests
//
//  Created by Alexandre Graverol on 26/09/2022.
//

import Foundation
import AsterCore
@testable import Aster

class StubHoroscopeService: Service {
    var stubHoroscopeResponse: HoroscopeResponse?
    var stubError: ServiceError?

    func getHoroscope(for sign: String, for day: String, completionHandler: @escaping (Result<AsterCore.HoroscopeResponse?, AsterCore.ServiceError>) -> Void) {
        if let stubHoroscopeResponse = stubHoroscopeResponse {
            completionHandler(.success(stubHoroscopeResponse))
        } else if let stubError = stubError {
            completionHandler(.failure(stubError))
        }
    }
}
