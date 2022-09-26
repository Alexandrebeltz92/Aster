//
//  Service.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 26/09/2022.
//

import Foundation

public protocol Service {
    func getHoroscope(for sign: String, for day: String, completionHandler: @escaping (Result<HoroscopeResponse?, ServiceError>) -> Void)
}
