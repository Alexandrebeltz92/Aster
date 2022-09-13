//
//  Card.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation

public class Card {
    public let name: String
    public let description: String

    public init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}

extension Card: Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    static public func == (lhs: Card, rhs: Card) -> Bool {
        (lhs.name) == (rhs.name)
    }
}
