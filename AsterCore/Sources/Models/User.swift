//
//  User.swift
//  AsterCore
//
//  Created by Alexandre Graverol on 09/09/2022.
//

import Foundation

public class User {

    public let pseudo: String
    public let astrologicalSign: String
    public var cards: [Card]

    public init(pseudo: String, astrologicalSign: String, cards: [Card]) {
        self.pseudo = pseudo
        self.astrologicalSign = astrologicalSign
        self.cards = cards
    }

}

extension User: Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(pseudo)
        hasher.combine(astrologicalSign)
    }

    static public func == (lhs: User, rhs: User) -> Bool {
        (lhs.pseudo, lhs.astrologicalSign, lhs.cards) == (rhs.pseudo, rhs.astrologicalSign, rhs.cards)
    }
}
