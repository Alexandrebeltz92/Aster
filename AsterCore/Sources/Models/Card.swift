//
//  Card.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation

public struct Card {
   public let name: String
//    let description: String
}

extension Card: Equatable {
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//        hasher.combine(description)
//    }

    static public func == (lhs: Self, rhs: Self) -> Bool {
        (lhs.name) == (rhs.name)
    }
}
