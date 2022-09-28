//
//  HoroscopeResponse.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation

public struct HoroscopeResponse: Decodable {
    public let sign: String
    public let text: String
    public let date: String
    public let type: String

    public init(sign: String, text: String, date: String, type: String) {
        self.sign = sign
        self.text = text
        self.date = date
        self.type = type
    }
}
