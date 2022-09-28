//
//  TarotCardViewModel.swift
//  Aster
//
//  Created by Alexandre Graverol on 19/08/2022.
//

import Foundation
import AsterCore

class TarotCardViewModel: ObservableObject {

    var cardToShow: Card

    init() {
        cardToShow = Self.generateCard()
    }

    private static func generateCard() -> Card {
        Cards.deck.randomElement() ?? Cards.deck[9]
    }

    func refreshCard() {
        cardToShow = Self.generateCard()
    }
}
