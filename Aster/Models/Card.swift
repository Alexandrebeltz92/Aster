//
//  Card.swift
//  Aster
//
//  Created by Alexandre Graverol on 30/08/2022.
//

import Foundation

struct Card {
    let name: String
//    let description: String
}

extension Card: Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
//        hasher.combine(description)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        (lhs.name) == (rhs.name)
    }
}
