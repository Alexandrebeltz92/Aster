//
//  TarotCardModelView.swift
//  Aster
//
//  Created by Alexandre Graverol on 19/08/2022.
//

import Foundation

extension TarotCardView {
    class TarotCardModelView {

    }
}

extension CardFront  {
    class CardFrontModelView: ObservableObject {
        @Published var tarotCard = "0 The Fool"

        let tarotCards = ["0 The Fool", "1 The Magician", "2 The High Priestess", "3 The Empress"]

        func getRandomCard() {
            tarotCard = tarotCards.randomElement() ?? "0_The_Fool"
        }
    }
}
