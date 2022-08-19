//
//  HoroscopeResponse.swift
//  Aster
//
//  Created by Alexandre Graverol on 17/08/2022.
//

import Foundation

struct HoroscopeResponse: Decodable {
    let sign: String
    let text: String
    let date: String
    let type: String
}
